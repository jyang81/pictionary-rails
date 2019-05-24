Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :games, only: [:index, :show, :update, :create, :destroy]
      resources :users, only: [:index, :show, :create]
      resources :words, only: [:index]
    end
  end
end
