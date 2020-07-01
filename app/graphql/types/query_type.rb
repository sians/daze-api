module Types
  class QueryType < Types::BaseObject

    field :photo, Types::PhotoType,
      description: "returns a photo by id",
      null: false do
        argument :id, ID, required: true
      end
    def photo(id:)
      Photo.find(id)
    end

    field :photos, [Types::PhotoType], null: false,
      description: "Returns all of a users Photos"
    def photos
      context[:current_resource].photos
    end


    field :me, Types::UserType, null: false,
      description: "Returns the current user"
    def me
      # binding.pry
      context[:current_resource] if context[:current_resource].class == User
    end

  end
end
