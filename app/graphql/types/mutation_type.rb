module Types
  class MutationType < Types::BaseObject

    field :create_photo, mutation: Mutations::Photos::CreatePhotoMutation

  end
end
