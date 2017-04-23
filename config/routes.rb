Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  #新規登録のURLをusers/newではなく,signup/newという風にしたいので、個別に設定
  #rails routesで確認すると、Preixにsignupとあるので、sign_pathでURL生成可能。
  #users/newでも新規登録のページは出せる。
  resources :users, only: [:show, :new, :create]
  #controllerで実装するものが限られる場合は、個別にしてしておく。
end

