class FavoritesController < ApplicationController
    
    def create
        @house = House.find(params[:house_id])
        current_user.favorite_houses << @house
        redirect_to @house, notice: "House has been added to your favorites"
      end
end
