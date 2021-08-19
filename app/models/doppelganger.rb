class Doppelganger < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
