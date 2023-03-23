class Api::V1::Users::RegistrationsController < Devise::RegistrationsController

  respond_to :json
  private

   def respond_with(resource, options={})
    if resource.persisted?
      render json: {
        status: 200,
        message: 'Signed up sucessfully.',
        data: UserSerializer.new(current_user)
      }, status: :ok 
    else
      render json: {
        status: 422,
        errors: resource.errors.messages
      }, status: :unprocessable_entity
      
    end
  end  
end
