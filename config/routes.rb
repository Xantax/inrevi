Inrevi::Application.routes.draw do

match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
match 'auth/failure', to: redirect('/'), via: [:get, :post]
match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
match 'media', to: 'media#index', as: 'media', via: [:get] 
match 'search' => "movies#search", via: [:get]
  
  root 'static_pages#home'
  get "static_pages/advertising"
  
  resources :users, :only => [:show, :index] do
    member do
      get :following 
      get :followers
    end
  end

  resources :sessions,      only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy] 
  
  resources :movies do
    resources :movie_reviews
  end


end
