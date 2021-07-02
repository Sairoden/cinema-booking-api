module Types
  class MovieType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :length, Integer, null: true
    field :description, String, null: true
    field :genre, String, null: true
    field :cinemas, [Types::CinemaType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
