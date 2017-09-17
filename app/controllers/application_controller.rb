class ApplicationController < ActionController::Base
  authorize_resource

  include Clearance::Controller

  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper

  protect_from_forgery with: :exception

  before_action :require_login
  before_action :check_mfa

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  private

  def check_mfa
    if !(user_mfa_session = UserMfaSession.find) && (user_mfa_session ? user_mfa_session.record == current_user : !user_mfa_session)
      redirect_to authentication_step_two_path
    end
  end
end
