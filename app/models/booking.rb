class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  validates :flat, presence: true
  validates :user, presence: true
  validates :date_check_in, presence: true
  validates :date_check_out, presence: true
  validates :number_of_guests, presence: true
end
