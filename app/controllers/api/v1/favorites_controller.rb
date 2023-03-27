class Api::V1::FavoritesController < ApplicationController

    before_action :authenticate_user!

    def create
      favorite = Favorite.new(user_id: current_user.id, house_id: params[:house_id])
      if favorite.save
        render json: { status: 'success', message: 'Favorite created successfully', data: FavoriteSerializer.new(favorite) },
                 status: :created
      else
        render json: favorite.errors, status: :unprocessable_entity
      end
    end

    def favorites
      @favorites = Favorite.where(user_id: current_user.id).includes(:house)
      render json: @favorites
    end

end
