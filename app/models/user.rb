class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :flats
  has_one_attached :photo
  has_many :bookings
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
