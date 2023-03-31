class House < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  validates :price, presence: { message: "can't be blank" }, numericality:
                              { greater_than_or_equal_to: 0, message:
                              'must be a positive number' }
  validates :description, presence: { message: "can't be blank" }, length:
                                    { minimum: 10, maximum: 500, message:
                                    'must be between 10 and 500 characters' }
  validates :price, presence: { message: "can't be blank" }, numericality:
                              { greater_than_or_equal_to: 0, message:
                              'must be a positive number' }
  validates :image, presence: true
  # validates :image, content_type: { in: %w[image/jpeg image/png image/gif image/webp],
  #                                   message: 'must be a valid image format' }
  # validates :image, size: { less_than: 5.megabytes,
  #                           message: 'should be less than 5MB' }
end
