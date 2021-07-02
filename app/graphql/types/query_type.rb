module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # MOVIES 
    field :movie, Types::MovieType, null: false do
      argument :id, ID, required: true
    end
    field :movies, [Types::MovieType], null: true
    # field :movies, resolver: Resolvers::MoviesSearch

    field :moviesCount, Integer, null: true

    def movie(id:)
      Movie.find(id)
    end

    # def movies
    #   Movie.all
    # end
    
    def moviesCount
      Movie.count
    end

    # USERS
    field :user, Types::UserType, null: false do 
      argument :id, ID, required: true
    end
    field :users, [Types::UserType], null: false
    field :usersCount, Integer, null: true

    def user(id:)
      User.find(id)
    end

    def users
      User.all
    end

    def usersCount
      User.count 
    end

    # CINEMAS 
    field :cinema, Types::CinemaType, null: false do 
      argument :id, ID, required: true
    end
    field :cinemas, [Types::CinemaType], null: false
    field :cinemasCount, Integer, null: true

    def cinema(id:)
      Cinema.find(id)
    end

    def cinemas
      Cinema.all
    end

    def cinemasCount
      Cinema.count 
    end

    # BOOKINGS
    field :booking, Types::BookingType, null: false do 
      argument :id, ID, required: true
    end
    field :bookings, [Types::BookingType], null: false
    field :bookingsCount, Integer, null: true


    def booking(id:)
      Booking.find(id)
    end

    def bookings
      Booking.all
    end

    def bookingsCount
      Booking.count 
    end

 
    

  end
end
