class Users::PasswordsController < Clearance::PasswordsController

  skip_before_action :check_mfa, only: [:create, :edit, :new, :update]

  def create
    user = find_user_for_create

    if user

      redirect_to sign_in_path, alert: 'You have not set up your account. Please check your email for instructions.' and return if !user.accepted_at

      user.forgot_password!
      deliver_email(user)
    end

    render template: 'passwords/create'
  end

  def update
    @user = find_user_for_update
    @user.password_confirmation = password_reset_params[:password_confirmation]

    if @user.update_password(password_reset_params[:password])
      sign_in @user
      redirect_to url_after_update
      session[:password_reset_token] = nil
    else
      flash_failure_after_update
      render template: 'passwords/edit'
    end
  end

  private

  def password_reset_params
    params.require(:password_reset).permit(:password, :password_confirmation)
  end

  def flash_failure_after_update
    flash.now.notice = @user.errors.full_messages.join(', ')
  end

end
