class AddForeignKeysTo < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :attendable_events, :users, column: :attendee_id
    add_foreign_key :attendable_events, :events, column: :attended_event_id
  end
end
