class AmenitiesFlat < ApplicationRecord
  belongs_to :amenity
  belongs_to :flat
  validates :amenity, presence: true
  validates :flat, presence: true
end
