Rails.application.routes.draw do
  # root to: redirect('/users/sign_up')
  devise_for :users
  resources :comments
  root to: redirect('/posts')
  get 'pages/info'
  resources :posts do
    resources :likes
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
