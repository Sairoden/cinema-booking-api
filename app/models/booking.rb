class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  after_save :booking_available_seat

  def booking_available_seat
    booking = Booking.last
    movie = Movie.find(booking.movie_id)
    cinema = movie.cinemas.first
    cinema.available_seat = cinema.available_seat - 1
    cinema.save
  end

  validates :seat_number, presence: true, uniqueness: true
  
end
