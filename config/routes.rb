Inrevi::Application.routes.draw do
match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
match 'auth/failure', to: redirect('/'), via: [:get, :post]
match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  
  root 'static_pages#home'
  get "static_pages/advertising"
  get "static_pages/faq"
  
  resources :users, :only => [:show, :index] do
    member do
      get :following 
      get :followers
    end
  end
  
  resources :sessions,      only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
  resources :media, :only => [:index] do
    
  end

end
