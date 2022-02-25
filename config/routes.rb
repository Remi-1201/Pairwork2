Rails.application.routes.draw do
  resources :blogs
  resources :users, only: [:new, :show, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
