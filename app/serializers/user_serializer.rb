class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :email, :houses

  def houses
    object.houses.map do |house|
      {
        id: house.id,
        title: house.title,
        image_url: house.image.attached? ? url_for(house.image) : nil,
      }
    end
  end
end
