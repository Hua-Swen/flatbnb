class Review < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  validates :comment, presence: true
  validates :rating, presence: true
  validates :user, presence: true
  validates :flat, presence: true
end
