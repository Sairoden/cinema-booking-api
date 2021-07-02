class Cinema < ApplicationRecord
  has_many :cinema_movies
  has_many :movies, through: :cinema_movies
end
