Rails.application.routes.draw do
  root "blogs#index"
  resources :blogs
  resources :users, only: [:new, :show, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
