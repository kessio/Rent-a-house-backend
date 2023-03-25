class House < ApplicationRecord
  has_one_attached :image
  
  has_many :favorites
  has_many :users, through: :favorites

end
