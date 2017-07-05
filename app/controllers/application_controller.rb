class ApplicationController < ActionController::Base
  include Clearance::Controller

  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper

  protect_from_forgery with: :exception

  before_action :require_login
  before_action :check_mfa

  private

  def check_mfa
    if !(user_mfa_session = UserMfaSession.find) && (user_mfa_session ? user_mfa_session.record == current_user : !user_mfa_session)
      redirect_to authentication_step_two_path
    end
  end
end
