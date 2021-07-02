class User < ApplicationRecord
  has_secure_password

  has_many :bookings
  has_many :movies, through: :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :contact, presence: true, length: {minimum: 11, maximum: 11}
    
end
