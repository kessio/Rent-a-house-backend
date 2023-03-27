class House < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  has_many :favorites
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

end
