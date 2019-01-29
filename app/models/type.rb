class Type < ApplicationRecord
  has_many :wines

  validates :name, uniqueness: true



end
