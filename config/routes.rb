Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  get 'users/:name', controller: 'users', action: 'edit'
  get 'products/:name', controller: 'products', action: 'show'
  resources :users, only: [:show] 
  resources :products,only:[:index, :new, :show]
end
