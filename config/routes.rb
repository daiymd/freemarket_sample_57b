Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "users#show"
  # get 'products/new'
  resources :products,only:[:index, :new, :show,:create] do
    collection  do
        get 'get_category_children'
        get 'get_category_grandchildren'
    end
  end
  root 'products#index'
  get 'users/:name', controller: 'users', action: 'edit'
  # get 'products/:name', controller: 'products', action: 'show'

    
  resources :users, only: [:show] 
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
  
  resources :signup,only: [:create] do
    collection do
      get 'member'
      get 'tell'
      get 'address'
      get 'pay' # ここで、入力の全てが終了する
      get 'completion' # 登録完了後のページ
    end
  end
end