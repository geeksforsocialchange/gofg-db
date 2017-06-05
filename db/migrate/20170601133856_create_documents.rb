class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :researcher
      t.string :conducted_at
      t.string :location
      t.string :type
      t.text :notes
      t.string :description
      t.integer :user_id

      t.timestamps
    end

    create_table :uploads do |t|
      t.attachment :attachment
      t.integer :subtype
      t.references :document, foreign_key: true
    end

    create_table :documents_people do |t|
      t.references :document, foreign_key: true
      t.references :person, foreign_key: true
    end

    create_table :documents_events do |t|
      t.references :document, foreign_key: true
      t.references :event, foreign_key: true
    end
  end
end
