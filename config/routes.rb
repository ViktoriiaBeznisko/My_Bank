Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  resources :users
  resources :money_requests, except: [:show] 
  get '/all_requests', to: 'money_requests#show', as: 'all_request' 

  #Routing Nested Resources
  resources :money_requests do
    resources :loans, only: [:new, :create, :index, :show]
  end
  resources :loans, only: [:show, :index, :update]

  resources :loans do
    resources :payments, only: [:new, :create, :index, :show]
  end
  resources :payments, only: [:show, :index]


  root to: 'application#welcome'
  get '/auth/facebook/callback' => 'sessions#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#signout'


end