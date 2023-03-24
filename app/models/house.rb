class House < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites
  has_one_attached :image

end
