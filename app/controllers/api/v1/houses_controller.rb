class Api::V1::HousesController < ApplicationController
    def create
        @house = House.new(house_params)
        if @house.save
          render json: { status: 'success', message: 'House created successfully' }, status: :created
        else
          render json: { status: 'error', message: 'Failed to create house', errors: @house.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      private
    
      def house_params
        params.require(:house).permit(:title, :description, :price, :image)
      end
end
