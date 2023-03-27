class Api::V1::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    favorite = Favorite.new(favorite_params)
    if favorite.save
      render json: {
        status: 'success',
        message: 'Favorite created successfully',
        data: FavoriteSerializer.new(favorite)
      }, status: :created
    else
      render json: favorite.errors, status: :unprocessable_entity
    end
  end

  def favorites
    user = User.find(params[:id])
    render json: user, serializer: UserSerialization
  end

  private

  def favorite_params
    params.require(:favorite).permit(:house_id).merge(user_id: current_user.id)
  end
end
