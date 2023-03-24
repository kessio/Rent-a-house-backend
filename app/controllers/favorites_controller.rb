class FavoritesController < ApplicationController

    before_action :authenticate_user!

    def index
        @favorites = current_user.favorites
        render json: @favorites, each_serializer: FavoriteSerializer
      end
      
    def create
        @house = House.find(params[:house_id])
        current_user.favorite_houses << @house
        redirect_to @house, notice: "House has been added to your favorites"
      end

      def destroy
        @favorite = current_user.favorites.find_by(house_id: params[:id])
        @favorite.destroy
        redirect_to root_path, notice: "House has been removed from your favorites"
      end
end
