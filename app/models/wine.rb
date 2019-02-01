class Wine < ApplicationRecord
  belongs_to :type
  has_many :user_wines
  has_many :users, through: :user_wines

  validates :name, presence: true
  validates :type_name, presence: true

  scope :bottle_drank, ->  {joins(:user_wines).merge(UserWine.drank)}
  scope :bottle_corked, -> {joins(:user_wines).merge(UserWine.corked)}

  def self.popular
     joins(:user_wines)
    .group(:id)
    .order('COUNT(user_id) DESC')
    .limit(5)
  end


  def type_name=(name)
     self.type = Type.find_or_create_by(name: name)
   end

   def type_name
      self.type ? self.type.name : nil
   end

end
