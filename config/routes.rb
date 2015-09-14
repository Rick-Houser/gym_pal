Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users do 
  	resource :profile
  end
  resources :contacts, only: [:new, :create]
  resources :workouts, only: [:index, :new, :create]

  get '/about' => 'pages#about'

  root 'pages#home'
end
