class Amenity < ApplicationRecord
  has_many :amenities_flats
  has_many :flats, through: :amenities_flats
  validates :name, presence: true
end
