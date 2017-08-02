class CreateInvitations < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :inviter_id, :integer
    add_column :users, :invited_at, :datetime
    add_column :users, :accepted_at, :datetime
    add_column :users, :google_secret, :string

    User.reset_column_information
    user = User.new(email: 'kim@alliscalm.net')
    user.google_secret = GoogleAuthenticatorRails::generate_secret
    user.generate_setup_fields

    user.save!
  end

  def down
    remove_column :users, :inviter_id
    remove_column :users, :invited_at
    remove_column :users, :accepted_at
    remove_column :users, :google_secret

  end
end
