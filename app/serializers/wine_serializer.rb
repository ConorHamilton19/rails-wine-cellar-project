class WineSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :price
end
