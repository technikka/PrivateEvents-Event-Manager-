class AttendableEvent < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'

  validates :attendee, presence: true
  validates :attended_event, presence: true

  validates_uniqueness_of :attendee_id, scope: :attended_event_id, message: 'You have already registered for this event'
end
