class CreateOrganisations < ActiveRecord::Migration[5.0]
  def change
    create_table :organisations do |t|
      t.string :name
      t.integer :activity
      t.string :email
      t.string :tel
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :postcode
      t.text :notes

      t.timestamps
    end
  end
end
