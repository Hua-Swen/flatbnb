class Review < ApplicationRecord
  belongs_to :flat
  belongs_to :traveller
  validates :comment, presence: true
  validates :rating, presence: true
  validates :traveller, presence: true
  validates :flat, presence: true
end
