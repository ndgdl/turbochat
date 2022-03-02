Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :rooms do
    resources :messages
  end

  devise_for :users

  get 'user/:id', to: 'users#show', as: 'user'
  get 'users', to: 'users#index', as: 'users'
  post 'users/search', to: 'users#search', as: 'search'


  # Defines the root path route ("/")
  root 'pages#home'
end
