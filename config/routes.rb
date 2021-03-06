Rails.application.routes.draw do
  root 'posts#index'
  get 'users/index'
  get 'privacy' => 'posts#privacy'
  get 'users/search'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :posts, only: [:create, :show, :edit, :update, :index, :destroy]
  resources :comments, only: [:create, :edit, :update, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :profiles, only: [:show, :edit, :update]
  resources :requests, only: [:create, :update, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
