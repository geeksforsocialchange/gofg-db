class ChangesToEventAndPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :other_attendees, :text
    remove_column :events, :other_attendee_count, :integer
    add_column :people, :consent, :string
    add_column :people, :consent_granted_on, :date
  end
end
