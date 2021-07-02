module Types
  class BookingType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :movie_id, Integer, null: false
    field :seat_number, String, null: true
    field :time_slot, String, null: true
    field :booked_by, UserType, null: false, method: :user
    field :booked_movie, MovieType, null: false, method: :movie
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    
  end
  
end
