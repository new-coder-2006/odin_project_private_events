class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "creator_id"
    has_many :attendances, dependent: :destroy
    has_many :attendees, through: :attendances, source: :user

    scope :past, -> { where("event_date < ?", Date.today) }
    scope :upcoming, -> { where("event_date >= ?", Date.today) }
    scope :undated, -> { where(event_date: nil) }
end
