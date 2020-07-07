module Mutations
  class UploadFileMutation < ::Mutations::BaseMutation
    argument :file, Upload!, required: false

    field :photo, Types::PhotoType, null: true
    field :errors, [String], null: false

    type Types::PhotoType

    def resolve(**attributes)
      user = context[:current_resource]
      new_attributes = attributes.merge(user: user)

      photo = Photo.create!(new_attributes)
    end
  end
end
