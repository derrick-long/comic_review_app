Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users
  resources :comics do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
  # resources :reviews, only: [:show, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
