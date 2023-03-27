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

  private
  def image_format_validation
    return unless image.attached? && !image.content_type.in?(%w[image/jpeg image/png image/gif image/webp])

    image.purge_later
    errors.add(:image, 'must be a valid image format')
  end

  validate :image_size_validation

end
