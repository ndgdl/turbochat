Rails.application.routes.draw do
  get 'users/show'
  root 'pages#home'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  devise_scope :user do
    get 'users', to: 'devise/session#new'
  end

  get 'user/:id', to: 'users#show', as: 'user'

  resources :rooms do
    resources :messages
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
