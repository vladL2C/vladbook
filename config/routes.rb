Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/feed', to: 'static_pages#feed'
  get '/profile/:id', to: 'users#profile', as: :profile
  get '/public_profile/:id', to: 'users#public_profile', as: :public_profile
  get '/search', to: 'users#find_user'
  resources :photos, only: [:create, :update] 
  resources :friendships, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
