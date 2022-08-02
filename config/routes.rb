Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      get '/users/me', to: 'users#me'
      resource :users
      resource :sessions, only: [:create, :destroy]
    end
  end
end
