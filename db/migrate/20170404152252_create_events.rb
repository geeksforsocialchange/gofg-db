class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :event_start
      t.datetime :event_end
      t.string :event_type
      t.string :location
      t.text :notes
      t.integer :other_attendee_count
      t.string :type

      t.timestamps
    end
  end
end
