Rails.application.routes.draw do
  root 'workouts#index'

  resources :workouts, only: [:index, :new, :create]
end
