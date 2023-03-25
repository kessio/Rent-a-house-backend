class HouseSerializer < ActiveModel::Serializer
  attributes :id, :title, ::description, :price, :user_id
end
