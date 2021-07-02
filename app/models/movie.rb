class Movie < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings

  has_many :cinema_movies
  has_many :cinemas, through: :cinema_movies
end
