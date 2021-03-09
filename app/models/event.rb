class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees, source: :attendee

  scope :upcoming, -> { where('event_date >= ?', Time.zone.now).order('event_date ASC') }
  scope :past, -> { where('event_date < ?', Time.zone.now).order('event_date DESC') }

  validates :name, presence: true
  validates :event_date, presence: true
end
