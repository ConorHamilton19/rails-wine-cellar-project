class Wine < ApplicationRecord
  belongs_to :type
  has_many :users, through: :user_wines
  has_many :user_wines
end
