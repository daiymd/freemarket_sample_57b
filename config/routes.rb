Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#create"
  resources :users do
    collection do
      get :card
      get :identification
      get :logout
      get :profile
      get :pay
      get :member
      get :adress
      get :tell
    end
  end
  resources :products
end
