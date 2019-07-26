Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount ActionCable.server => '/cable'
      resources :games, only: [:index, :show, :update, :create, :destroy]
      resources :users, only: [:index, :show, :create, :update]
      resources :words, only: [:index]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
