class WineSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :price, :type
  belongs_to :type
  has_many :users, through: :user_wines
end
