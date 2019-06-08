Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '/admin' do
    resources :posts, except: :show do
      resources :comments, except: :show
    end
    root 'posts#index'
  end

  root 'welcome#index'
end
