Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :games, only: [:index, :show, :update, :create, :destroy]
      resources :users, only: [:index, :show, :create, :update]
      resources :words, only: [:index]
      resources :lines, only: [:index]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      mount ActionCable.server => '/cable'
    end
  end
end
