module Mutations
  class CreateUser < BaseMutation
    
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    field :user, Types::UserType, null: true
    field :message, String, null: true

    argument :auth_provider, AuthProviderSignupData, required: false
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :contact, String, required: true
    
    def resolve(first_name:, last_name:, auth_provider:, contact:)
      user = User.new(
        first_name: first_name,
        last_name: last_name,
        email: auth_provider&.[](:credentials)&.[](:email),
        password: auth_provider&.[](:credentials)&.[](:password),
        contact: contact)

      if (user.save)
        {
          user: user,
          message: "You have successfully registered this account",
          errors: []
        } else {
          user: nil, 
          message: "Unable to register, please try again",
          errors: user.errors.full_messages
        }
      end

    end

  end
end
