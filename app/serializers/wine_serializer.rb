class WineSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :price, :type
  belongs_to :type
end
