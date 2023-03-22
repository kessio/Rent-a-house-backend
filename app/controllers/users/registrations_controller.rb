class Users::RegistrationsController < Devise::RegistrationsController
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
        status: { message: 'User not created Successfully',
        error: resource.errors.full_messages}, status: :unprocessable_entity
      }
    end
  end  
end
