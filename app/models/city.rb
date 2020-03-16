class City < ApplicationRecord
  has_many :flats
  validates :name, presence: true
end
