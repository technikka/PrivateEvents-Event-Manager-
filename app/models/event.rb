class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :attendable_events, foreign_key: :attendee_id
  has_many :attendees, through: :attendable_events

  validates :creator_id, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :title, presence: true
end
