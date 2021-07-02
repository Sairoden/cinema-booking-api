module Mutations
  class CreateCinemaMovie < BaseMutation
    
    field :cinemaMovie, Types::CinemaMovieType, null: true

    argument :cinema_id, ID, required: true
    argument :movie_id, ID, required: true


    def resolve(cinema_id:, movie_id:)
      cinemaMovie = CinemaMovie.new(cinema_id: cinema_id, movie_id: movie_id)

      if (cinemaMovie.save) 
        {
          cinemaMovie: cinemaMovie,
          errors: []
        } else { 
          cinemaMovie: nil,
          errors: cinemaMovie.errors.full_messages
         }
      end

    end

  end
end
