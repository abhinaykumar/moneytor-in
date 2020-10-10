require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'home#index'

  resources :mutual_funds, except: %i[show index]
  resources :stocks, except: %i[show index]
  resources :saving_accounts, except: %i[show index]
  resources :cryptocurrencies, except: %i[show index]

  resources :listed_stocks, only: [] do
    collection do
      get :search
    end
  end

  resources :listed_mutual_funds, only: [] do
    collection do
      get :search
    end
  end

  resources :listed_banks, only: [] do
    collection do
      get :search
    end
  end

  resources :listed_cryptocurrencies, only: [] do
    collection do
      get :search
    end
  end

  namespace :admin do

    resources :listed_cryptocurrencies

    resources :cryptocurrencies

    resources :listed_banks

    resources :listed_mutual_funds

    resources :listed_stocks
    resources :portfolios
    resources :asset_classes
    resources :stocks
    resources :saving_accounts
    resources :mutual_funds
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

  # APIs

  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
      resources :stocks, onyl: [:index]
    end
  end
end
