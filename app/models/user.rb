class User < ApplicationRecord
  has_many :user_wines
  has_many :wines, through: :user_wines 
end
