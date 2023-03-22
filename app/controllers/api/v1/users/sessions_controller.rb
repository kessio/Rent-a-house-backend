class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, options={})
  if current_user
   render json: {
    status: 200,
    message: 'User Signed In Successfully',
    data: UserSerializer.new(current_user)
   },status: :ok

  else 
      render json: {
        status: 401,
        message: "Logged in failure. #{resource.errors.full_messages.to_sentence}",
        data: UserSerializer.new(current_user)
      }, status: :unauthorized
    end

  end

  def respond_to_on_destroy
    #if request.headers['Authorization'].present?

      jwt_payload = JWT.decode(request.headers['Authorization'].split.last, ENV.fetch('DEVISE_JWT_SECRET')).first
       
      current_user = User.find(jwt_payload['sub'])

      if current_user
        render json: {
          status: 200,
          message: 'Signed Out Successfully'
        }, status: :ok

        else 
          render json: {
            status: 401,
            message: 'User has no active session'
          }, status: :unauthorized
        end
  end

  
end
