class CreateEventAttendees < ActiveRecord::Migration[6.1]
  def change
    create_table :event_attendees do |t|
      t.integer :attendee_id, null: false
      t.integer :attended_event_id, null: false
      


      t.timestamps
    end
  end
end
