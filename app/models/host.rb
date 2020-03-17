class Host < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :flats
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end