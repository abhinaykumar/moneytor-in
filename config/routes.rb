require 'sidekiq/web'

Rails.application.routes.draw do
  resources :stocks
  namespace :admin do
    resources :portfolios
    resources :asset_classes
    resources :stocks
    resources :users
    resources :announcements
    resources :notifications
    resources :services

    root to: 'users#index'
  end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # APIs

  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
    end
  end
end
