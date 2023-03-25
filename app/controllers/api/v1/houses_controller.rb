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
          render json: { status: 'success', message: 'House created successfully', data: HouseSerializer.new(house) },
                 status: :created
        else
          render json: { status: 'error', message: 'Failed to attach image to house', errors: 'Image is not attached' },
                 status: :unprocessable_entity
        end
      else
        render json: { status: 'error', message: 'Failed to create house', errors: house.errors.full_messages },
               status: :unprocessable_entity
      end
    else
      render json: { errors: 'You are not authorized to create a house.' }, status: :unauthorized
    end
  end

  def show
    if current_user
      @houses = current_user.houses
  
      if @houses.empty?
        render json: { status: 'success', message: 'You have not added any houses yet' }, status: :ok
      else
        render json: { status: 'success', data: HouseSerializer.new(@houses) }, status: :ok
      end
  
    else
      render json: { errors: 'You are not authorized to view this page.' }, status: :unauthorized
    end
  end

  def destroy
    house = House.find(params[:id])
  
    if house.destroy
      render json: { status: 'success', message: 'House deleted successfully' }, status: :ok
    else
      render json: { status: 'error', message: 'Failed to delete house', errors: house.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def house_params
    params.require(:house).permit(:title, :description, :price, :image).merge(user_id: current_user.id)
  end
end