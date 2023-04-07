class HouseSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :price, :user_id, :image_url
  def user_id
    object.user_id
  end

  def image_url
    return unless object.image.attached?

    Rails.application.routes.url_helpers.rails_blob_url(object.image, only_path: true)
  end
end
