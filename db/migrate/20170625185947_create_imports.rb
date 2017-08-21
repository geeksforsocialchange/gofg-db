class CreateImports < ActiveRecord::Migration[5.0]
  def change
    create_table :imports do |t|
      t.attachment :file
      t.integer :type
      t.integer :step
      t.references :person, foreign_key: true
      t.jsonb :result, default: {}
      t.timestamps
    end

    create_table :demographics do |t|
      t.references :person, foreign_key: true
      t.string :local_authority
      t.string :ward
      t.string :gender
      t.string :ethnicity
      t.string :ethnicity_continued
      t.string :religion
      t.string :age_at_referral
      t.text :agency_name
    end

    create_table :questionnaires do |t|
      t.string :name
      t.jsonb :content, default: {}

      t.references :import, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end

    add_column :people, :identifier, :string
  end
end
