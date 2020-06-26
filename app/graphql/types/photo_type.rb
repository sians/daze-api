module Types
  class PhotoType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :description, String, null: true
    field :latitude, Float, null: true
    field :longitude, Float, null: true
    field :city, String, null: true
    field :title, String, null: true
    field :status, Integer, null: true
    field :mood, Integer, null: true
  end
end
