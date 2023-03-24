class HousesController < ApplicationController
    def create
        @house = House.new(house_params)
        if @house.save
          render json: @house, status: :created
        else
          render json: @house.errors, status: :unprocessable_entity
        end
      end
    
      private
    
      def house_params
        params.require(:house).permit(:title, :description, :price, :image)
      end
end
