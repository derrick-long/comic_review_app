Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users
  scope "/admin" do
    resources :users
  end
  resources :comics do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :votes, only: [:create]
    end
  end

  resources :votes, only: [:create]

end
