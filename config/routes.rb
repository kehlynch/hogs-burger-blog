# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index', as: 'main'

  scope '/admin' do
    resources :posts, except: :show do
      resources :comments, except: :show
    end
    root 'posts#index'
  end
end
