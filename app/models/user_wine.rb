class UserWine < ApplicationRecord
  belongs_to :user
  belongs_to :wine

  scope :drank, -> {where(uncorked: 1)}
  scope :corked, -> {where(uncorked: 0)}


end
