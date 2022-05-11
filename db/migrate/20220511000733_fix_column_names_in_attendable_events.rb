class FixColumnNamesInAttendableEvents < ActiveRecord::Migration[7.0]
  def change
    rename_column :attendable_events, :attendee_id_id, :attendee_id
    rename_column :attendable_events, :attended_event_id_id, :attended_event_id
  end
end
