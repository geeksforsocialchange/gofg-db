class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.references :person, foreign_key: true
      t.references :organisation, foreign_key: true
      t.date :member_start
      t.date :member_end
      t.text :notes

      t.timestamps
    end
  end
end
