class Booking < ApplicationRecord
  belongs_to :doppelganger
  belongs_to :user
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true
  enum status: %i[pending rejected accepted]
end
