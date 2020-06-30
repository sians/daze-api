module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :first_name, String, null: true
    field :username, String, null: false
    field :password, String, null: false
    field :photos, [Types::PhotoType], null: true
  end
end
