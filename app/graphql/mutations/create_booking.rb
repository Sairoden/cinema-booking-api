module Mutations
  class CreateBooking < BaseMutation
   
    field :booking, Types::BookingType, null: true

    argument :seat_number, String, required: true
    argument :time_slot, String, required: true
    argument :movie_id, ID, required: true

    def resolve(seat_number:, time_slot:, movie_id:)
      booking = Booking.new(seat_number: seat_number, time_slot: time_slot, movie_id: movie_id, user: context[:current_user])


      if (booking.save) 
        {
          booking: booking,
          errors: []
        } else { 
          booking: nil,
          errors: booking.errors.full_messages
         }
      end

    end

  end
end
