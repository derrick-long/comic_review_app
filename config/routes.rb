Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users
  scope "/admin" do
    resources :users
  end
  resources :comics do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
end
