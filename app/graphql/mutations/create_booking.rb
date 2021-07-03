module Mutations
  class CreateBooking < BaseMutation
   
    field :booking, Types::BookingType, null: true
    field :message, String, null: true


    argument :seat_number, Integer, required: true
    argument :time_slot, String, required: true
    argument :movie_id, ID, required: true

    def resolve(seat_number:, time_slot:, movie_id:)
      booking = Booking.new(seat_number: seat_number, time_slot: time_slot, movie_id: movie_id, user: context[:current_user])

      # if booking.errors.full_messages.first == "Seat number has already been taken"
      #   message: "You must be logged in to book a movie!",


      if (booking.save) 
        {
          booking: booking,
          message: "You have successfully booked this movie",
          errors: []
        } else { 
          booking: nil,
          message: booking.errors.full_messages.first == "Seat number has already been taken" ? "Seat number has already been taken" : "You must be logged in to book a movie!",
          errors: booking.errors.full_messages
         }
      end

    end

  end
end
