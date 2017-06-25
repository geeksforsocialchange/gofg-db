class AddConfirmedAtAndGoogleSecretToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :confirmed_at, :datetime
    add_column :users, :google_secret, :string
  end
end
