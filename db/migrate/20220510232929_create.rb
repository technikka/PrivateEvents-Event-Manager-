class Create < ActiveRecord::Migration[7.0]
  def change
    create_table :attendable_events, id: false do |t|
      t.references :attendee_id, null: false
      t.references :attended_event_id, null: false

      t.timestamps
    end
    # add_foreign_key :attendable_events, :users, column: :attendee_id
    # add_foreign_key :attendable_events, :events, column: :attended_event
  end
end
