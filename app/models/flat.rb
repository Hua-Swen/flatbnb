class Flat < ApplicationRecord
  belongs_to :city
  belongs_to :host
  has_many :amenities_flats
  has_many :amenities, through: :amenities_flats
  has_many :bookings
  has_many :reviews

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :number_of_guests, presence: true
  validates :price_per_night, presence: true
  validates :address_name, presence: true
  validates :host, presence: true
  validates :city, presence: true
end
