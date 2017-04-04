class CreatePeers < ActiveRecord::Migration[5.0]
  def change
    create_table :peers do |t|
      t.integer :people, :participant_id, foreign_key: true
      t.integer :people, :mentor_id, foreign_key: true
      t.date :peer_start
      t.date :peer_end
      t.text :notes

      t.timestamps
    end
  end
end
