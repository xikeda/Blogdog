Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments
  end

  # Home
  root "posts#index"

  # About
  get '/about', to: 'pages#about'
end
