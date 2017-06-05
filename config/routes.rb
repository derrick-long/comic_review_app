Rails.application.routes.draw do
  root 'static_pages#home'
  # get '/comics', to: 'comics#index'
  # get '/comics/new', to: 'comics#new'
  # post '/comics/new', to: 'comics#create'
  devise_for :users
  resources :comics do
    resources :reviews, only: [:create, :destroy]
  end

    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
