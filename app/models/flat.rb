class Flat < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :amenities_flats, dependent: :destroy
  has_many :amenities, through: :amenities_flats
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :number_of_guests, presence: true
  validates :price_per_night, presence: true
  validates :address_name, presence: true
  validates :user, presence: true
  validates :city, presence: true

  geocoded_by :address_name
  after_validation :geocode, if: :will_save_change_to_address_name?
end

