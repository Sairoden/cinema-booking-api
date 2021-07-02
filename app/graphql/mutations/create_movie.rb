module Mutations
  class CreateMovie < BaseMutation
    
    field :movie, Types::MovieType, null: true

    argument :title, String, required: true
    argument :length, Integer, required: true
    argument :description, String, required: true
    argument :genre, String, required: true

    def resolve(title:, length:, description:, genre:)
      movie = Movie.new(title: title, length: length, description: description, genre: genre)

      if (movie.save)
        {
          movie: movie,
          errors: []
        } else {
          movie: nil,
          errors: movie.errors.full_messages
        }
      end
      
    end

  end
end
