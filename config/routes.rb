Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      get '/users/me', to: 'users#me'
      delete '/records/:id', to:'records#destroy'
      resource :users
      resource :sessions, only: [:create, :destroy]
      resource :records
    end
  end
end
