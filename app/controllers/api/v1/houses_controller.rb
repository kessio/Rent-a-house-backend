class Api::V1::HousesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @houses = House.all
    render json: @houses, status: :ok
  end

    def create
      if current_user
        house = House.new(house_params)

        if house.save
          if house.image.attached?
          render json: { status: 'success', message: 'House created successfully', data: HouseSerializer.new(house) }, status: :created
          else
            render json: { status: 'error', message: 'Failed to attach image to house', errors: 'Image is not attached' }, status: :unprocessable_entity
          end
        else
          render json: { status: 'error', message: 'Failed to create house', errors: house.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { errors: 'You are not authorized to create a house.' }, status: :unauthorized
      end
      end
    
      private
    
      def house_params
        params.require(:house).permit(:title, :description, :price, :image).merge(user_id: current_user.id)
      end
end
