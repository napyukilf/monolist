Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  #Readの要求
  post 'login' ,to: 'sessions#create'
  #Createの操作アクション
  delete 'logout', to: 'sessions#destroy'
  #deleteの操作アクション
  #CRUDに対応するHTTPリクエストのメソッド
  
  get 'signup', to: 'users#new'
  #新規登録のURLをusers/newではなく,signup/newという風にしたいので、個別に設定
  #rails routesで確認すると、Preixにsignupとあるので、sign_pathでURL生成可能。
  #users/newでも新規登録のページは出せる。
  
  get 'rankings/want', to: 'rankings#want'
  get 'rankings/have', to: 'rankings#have'
  
  resources :users, only: [:show, :new, :create]
  #controllerで実装するものが限られる場合は、個別にしてしておく。
  resources :items,only: [:show, :new]
  resources :ownerships, only: [:create, :destroy]
  
end

