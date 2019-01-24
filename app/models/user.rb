class User < ApplicationRecord
  has_secure_password

  has_many :user_wines
  has_many :wines, through: :user_wines
end
