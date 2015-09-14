Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  
  get '/about' => 'pages#about'

  root 'pages#home'
  # root 'workouts#index'
  resources :contacts, only: [:new, :create]
  resources :workouts, only: [:index, :new, :create]
end
