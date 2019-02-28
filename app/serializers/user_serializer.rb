class UserSerializer < ActiveModel::Serializer
  attributes :id
  has_many :wines, through: :user_wines
end
