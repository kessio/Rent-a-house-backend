class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private
   def respond_with(resource, options={})
    if resource.persisted?
      render json: {
        status: {
          code: 200, message: 'Signup Successfully',
          data: resource
        }, status: :ok
      }
    else
      render json: {
        status: { message: 'User not created Successfully',
        error: resource.error.full_messages}, status: :unprocessable_entity
      }
    end
end
