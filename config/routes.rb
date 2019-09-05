Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  get 'users/:name', controller: 'users', action: 'edit'
  get 'products/:name', controller: 'products', action: 'show'
  resources :users, only: [:show] 
  resources :products,only:[:index, :new, :show]
  
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
