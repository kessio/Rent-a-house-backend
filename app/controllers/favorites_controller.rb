class FavoritesController < ApplicationController

    before_action :authenticate_user!

    def add_to_favorites
      favorite = Favorite.new(user_id: current_user.id, house_id: params[:house_id])
      if favorite.save
        render json: favorite, status: :created
      else
        render json: favorite.errors, status: :unprocessable_entity
      end
    end

    def display_user_favorites
      @favorites = Favorite.where(user_id: current_user.id).includes(:house)
      render json: @favorites
    end

end
