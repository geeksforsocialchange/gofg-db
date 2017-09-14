class User < ApplicationRecord
  include Clearance::User

  attr_accessor :password_confirmation

  belongs_to :inviter, class_name: 'User', foreign_key: :inviter_id
  validate :password_matches_confirmation, on: :update

  after_create :send_invitation

  acts_as_google_authenticated issuer: 'GOFG', drift: 31, lookup_token: :remember_token

  def generate_setup_fields
    self.password = Clearance::Token.new
    self.confirmation_token = Clearance::Token.new
    self.invited_at = DateTime.now
  end

  private

  def password_matches_confirmation
    unless password == password_confirmation
      errors.add(:password_confirmation, 'does not match password')
    end
  end

  def send_invitation
    UserMailer.invitation_email(self).deliver_now
  end
end
