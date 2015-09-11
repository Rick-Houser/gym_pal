Rails.application.routes.draw do
  devise_for :users
  
  root 'workouts#index'

  resources :workouts, only: [:index, :new, :create]
end
