module Mutations
  class Logout < BaseMutation
    
    field :message, String, null: true

    def resolve
      if context[:current_user]
        context[:session][:token] = ''
        message = 'User has logged out'
      else
        message = "User currently not logged in"
      end
      { message: message }
    end

  end
end
