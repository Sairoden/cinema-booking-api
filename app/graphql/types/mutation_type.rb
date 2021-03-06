module Types
  class MutationType < Types::BaseObject
    field :logout, mutation: Mutations::Logout
    field :create_cinema_movie, mutation: Mutations::CreateCinemaMovie
    field :create_booking, mutation: Mutations::CreateBooking
    field :create_cinema, mutation: Mutations::CreateCinema
    field :login, mutation: Mutations::Login
    field :create_user, mutation: Mutations::CreateUser
    field :create_movie, mutation: Mutations::CreateMovie
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
