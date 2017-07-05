class Users::SessionsController < Clearance::SessionsController

  skip_before_action :check_mfa, only: [:create, :new, :destroy]
end
