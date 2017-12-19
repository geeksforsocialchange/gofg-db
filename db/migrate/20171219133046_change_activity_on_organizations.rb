class ChangeActivityOnOrganizations < ActiveRecord::Migration[5.1]
  def up
    change_column :organisations, :activity, :string
  end

  def down
    change_column :organisations, :activity, :integer
  end
end
