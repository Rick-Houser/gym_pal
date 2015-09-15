Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :workouts
  resources :users do 
  	resource :profile
  end
  resources :contacts, only: [:new, :create]
  get '/about' => 'pages#about'

  root 'pages#home'
end
