module Types
  class QueryType < Types::BaseObject

    field :photo, Types::PhotoType, null: false,
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
      context[:current_user].photos
    end
  end

end
