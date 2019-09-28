# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: redirect('/blog')
  get '/blog', to: 'posts#index', as: 'posts'

  resources :posts, only: :index do
    resources :comments, only: :create
  end

  resources :questions, only: [:index, :create] do
    resources :question_comments, only: :create
  end

  namespace :admin do
    root 'posts#index'
    resources :posts, except: :show do
      resources :comments, only: [:index, :destroy]
    end
    
    resources :questions, only: [:index, :destroy] do
      resources :question_comments, only: [:index, :create, :destroy]
    end
  end
end
