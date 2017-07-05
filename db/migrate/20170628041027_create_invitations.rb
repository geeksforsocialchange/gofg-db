class CreateInvitations < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :inviter_id, :integer
    add_column :users, :invited_at, :datetime
    add_column :users, :accepted_at, :datetime
    add_column :users, :google_secret, :string

    user = User.new(email: 'kim@alliscalm.net')
    user.generate_setup_fields

    user.save!
    user.set_google_secret
  end

  def down
    remove_column :users, :inviter_id
    remove_column :users, :invited_at
    remove_column :users, :accepted_at
    remove_column :users, :google_secret

  end
end
