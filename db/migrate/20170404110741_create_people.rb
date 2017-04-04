class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :nicknames
      t.string :tel
      t.string :email
      t.string :twitter
      t.boolean :is_accreditor
      t.date :dob
      t.text :notes

      t.timestamps
    end
  end
end
