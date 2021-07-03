module Mutations
  class CreateCinema < BaseMutation
    
    field :cinema, Types::CinemaType, null: true
    field :message, String, null: true

    argument :title, String, required: true
    argument :available_seat, Integer, required: true


    def resolve(title:, available_seat:)
      cinema = Cinema.new(title: title, available_seat: available_seat)

      if (cinema.save) 
        {
          cinema: cinema,
          message: "You have successfully created this cinema",
          errors: []
        } else { 
          cinema: nil,
          message: "Unable to create this cinema",
          errors: cinema.errors.full_messages
         }
      end

    end

  end
end
