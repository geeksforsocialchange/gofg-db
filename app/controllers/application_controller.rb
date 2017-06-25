class ApplicationController < ActionController::Base
  include Clearance::Controller

  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper

  protect_from_forgery with: :exception

  #before_action :require_login
end
