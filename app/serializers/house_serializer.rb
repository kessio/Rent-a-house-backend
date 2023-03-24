class HouseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :image
end
