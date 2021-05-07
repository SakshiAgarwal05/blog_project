# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  resources :articles
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
