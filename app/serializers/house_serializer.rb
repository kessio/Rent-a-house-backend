class HouseSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :price, :user_id

  def user_id
    object.user_id
  end
end
