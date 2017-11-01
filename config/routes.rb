Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/feed', to: 'static_pages#feed'
  get '/profile/:id', to: 'users#profile', as: :profile

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
