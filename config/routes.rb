Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :rooms do
    resources :messages
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'user/:id', to: 'users#show', as: 'user'
  post 'users/search', to: 'users#search', as: 'search'


  # Defines the root path route ("/")
  root 'pages#home'
end
