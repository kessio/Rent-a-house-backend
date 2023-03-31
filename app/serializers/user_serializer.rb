class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :email, :houses, :favorites

  def houses
    object.houses.map do |house|
      {
        id: house.id,
        title: house.title,
        image_url: house.image.attached? ? url_for(house.image) : nil
      }
    end
  end

  def favorites
    object.favorites.map do |favorite|
      house = House.find_by(id: favorite.house_id)
      {
        id: favorite.id,
        user_id: favorite.user_id,
        house_id: favorite.house_id,
        house_title: house.title,
        image_url: house.image.attached? ? url_for(house.image) : nil
      }
    end
  end
end
