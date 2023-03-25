class House < ApplicationRecord
  has_one_attached :image
  
  has_many :favorites
  has_many :users, through: :favorites

  def image_url
      Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end

end
