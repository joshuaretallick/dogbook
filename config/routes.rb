Rails.application.routes.draw do
  devise_for :users
  resources :comments
  get 'pages/info'
  root to: redirect('/users/sign_up')
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
