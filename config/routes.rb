Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "users#show"
  get 'users/:name', controller: 'users', action: 'edit'
  resources :users, only: [:show] 
  resources :products
end
