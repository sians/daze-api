module Mutations
  module Photos
    class CreatePhotoMutation < ::Mutations::BaseMutation
      argument :id, String, required: false
      argument :description, String, required: false
      argument :latitude, Float, required: false
      argument :longitude, Float, required: false
      argument :city, String, required: false
      argument :title, String, required: false
      argument :status, Integer, required: false
      argument :mood, Integer, required: false
      argument :photo, String, required: false

      field :photo, Types::PhotoType, null: true
      field :errors, [String], null: false

      type Types::PhotoType

      def resolve(**attributes)
        user = context[:current_user]
        new_attributes = attributes.merge(user: user)

        photo = Photo.create!(new_attributes)
      end
    end
  end
end
