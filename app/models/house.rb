class House < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :image, presence: true
  validates :image, content_type: { in: %w[image/jpeg image/png image/gif image/webp],
    message: "must be a valid image format" }
end
