Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "users#show"
  # get 'products/new'
  resources :products,only:[:index, :new, :show] do
    collection  do
        get 'get_category_children'
        get 'get_category_grandchildren'
    end
  end
  get 'users/:name', controller: 'users', action: 'edit'
  # get 'products/:name', controller: 'products', action: 'show'

    
  resources :users, only: [:show] 
  
end
