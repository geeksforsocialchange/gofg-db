class Users::SessionsController < Clearance::SessionsController
  skip_authorize_resource

  skip_before_action :check_mfa, only: [:create, :new, :destroy]
end
