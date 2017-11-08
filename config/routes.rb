Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/feed', to: 'static_pages#feed'
  get '/profile/:id', to: 'users#profile', as: :profile
  get '/public_profile/:id', to: 'users#public_profile', as: :public_profile
  get '/search', to: 'users#find_user'
  get '/profile/:id/friends', to: 'users#friends', as: :friends
  get '/profile/:id/sent_requests', to: 'users#sent_requests', as: :sent_requests
  get '/profile/:id/received_requests', to: 'users#received_requests', as: :received_requests
  resources :photos, only: [:create, :update] 
  resources :friendships, only: [:create]
  resources :posts, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  delete 'friendship', to: 'friendships#destroy', as: :friendship

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
