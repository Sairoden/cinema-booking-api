module Types
  class CinemaType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :available_seat, Integer, null: true
    field :movie_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
