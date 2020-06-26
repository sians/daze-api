module Types
  class QueryType < Types::BaseObject

    field :photos, [Types::PhotoType], null: false,
      description: "Returns all of a users Photos"
    def photos
      context[:current_user].photos
    end
  end

end
