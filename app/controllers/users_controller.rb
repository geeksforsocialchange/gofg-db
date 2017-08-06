class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :set_user_by_id_and_confirmation_token, only: [:setup, :complete]
  skip_before_action :require_login, only: [:setup, :complete]
  skip_before_action :check_mfa, only: [:setup, :complete]

  def index
    @users = smart_listing_create(:users, User.all, partial: 'users/listing')
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_create_params)
    @user.generate_setup_fields
    @user.inviter_id = current_user.id

    if @user.set_google_secret
       render format: :js
    else

    end
  end

  def update
    if @user.update(user_update_params)
      render format: :js
    else
    end
  end

  def destroy
    @user.destroy
    render format: :js
  end

  def setup
    if @user.blank? || @user.accepted_at.present?
      @message = 'You are not permitted to perform this action'
    elsif current_user
      @message = 'You are already signed in'
    end

    redirect_to root_path, alert: @message if @message.present?

    session[:password_reset_token] = params[:token]
  end

  def complete
    @user.accepted_at = DateTime.now
    @user.confirmation_token = nil

    if @user.update(user_setup_params)
      sign_in @user do |status|
        if status.success?
          redirect_to authentication_step_two_path and return
        else
          flash.now.alert = status.try(:failure_message)
        end
      end
    end

    render :setup, status: :unauthorized
  end

  private

  def set_user_by_id_and_confirmation_token
    token = session[:password_reset_token] || params[:token]
    @user = User.find_by(id: params[:id], confirmation_token: token)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_create_params
    params.require(:user).permit(:email)
  end

  def user_update_params
    params.require(:user).permit(:email, :password)
  end

  def user_setup_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
