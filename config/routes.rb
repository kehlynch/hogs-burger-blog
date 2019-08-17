# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index', as: 'home'

  resources :posts, only: :index do
    resources :comments, only: :create
  end

  namespace :admin do
    resources :posts, except: :show do
      resources :comments, only: [:index, :destroy]
    end
    root 'posts#index'
  end
end
