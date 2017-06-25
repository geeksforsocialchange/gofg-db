class User < ApplicationRecord
  include Clearance::User

  acts_as_google_authenticated

  def generate_temp_password
    Clearance::Token.new
  end
end
