Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "users#show"
  get 'users/:name', controller: 'users', action: 'edit'
  resources :users, only: [:show] 
  resources :products
end
