class House < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
end
