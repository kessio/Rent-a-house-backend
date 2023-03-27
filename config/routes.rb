Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    scope :v1 do
     devise_for :users,
   controllers: {
    sessions: 'api/v1/users/sessions',
    registrations: 'api/v1/users/registrations'
  },
  path: "",
        path_names: {
          sign_in: "login",
          registration: "register",
          sign_out: "logout"
        }
    end
  end
  namespace :api do 
    namespace :v1 do 
      resources :users, only: [:index] 
      resources :houses, only: [:index, :create, :destroy, :show]
      resources :favorites, only: [:create]
      
      end
    end
  
end
