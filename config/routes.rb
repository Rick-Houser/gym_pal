Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :contacts, only: [:new, :create]
  resources :workouts
  resources :users do 
  	resource :profile
  end

  authenticated :user do 
  	root 'workouts#index', as: "authenticated_root"
  end

  get '/about' => 'pages#about'

  root 'pages#home'
end
