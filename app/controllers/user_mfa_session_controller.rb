class UserMfaSessionController < ApplicationController

  skip_authorize_resource
  skip_before_action :check_mfa

  def new
  end

  def create
    user = current_user

    if user.google_authentic?(params[:user_mfa_session][:code])
      UserMfaSession.create(user)
      flash.notice = 'You have been successfully signed in'
      redirect_to root_path
    else
      flash[:alert] = 'Incorrect code. Please try again.'
      render :new
    end
  end
end
