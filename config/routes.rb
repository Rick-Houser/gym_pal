Rails.application.routes.draw do
  devise_for :users
  
  get '/about' => 'pages#about'

  root 'pages#home'
  # root 'workouts#index'

  resources :workouts, only: [:index, :new, :create]
end
