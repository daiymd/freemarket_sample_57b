Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  get 'users/:name', controller: 'users', action: 'edit'
  resources :users, only: [:show] 
  resources :products,only:[:index, :new, :show] 
  resources :payments, only: [:new, :show] do
    collection do
      post 'show', to: 'payments#show'
      post 'pay', to: 'payments#pay'
      post 'delete', to: 'payments#delete'
    end
  end

  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
  
end
