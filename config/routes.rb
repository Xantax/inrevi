Inrevi::Application.routes.draw do

  get "books/index"
  get "books/show"
match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
match 'auth/failure', to: redirect('/'), via: [:get, :post]
match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
match 'media', to: 'media#index', as: 'media', via: [:get]
match 'search' => "movies#search", via: [:get]
match 'lsearch' => "locals#lsearch", via: [:get]
match 'songsearch' => "songs#songsearch", via: [:get]
match 'about' => "static_pages#about", via: [:get]
match 'advertising' => "static_pages#advertising", via: [:get]
match 'contact' => "static_pages#contact", via: [:get]
match 'careers' => "static_pages#careers", via: [:get]
match 'tos' => "static_pages#tos", via: [:get]
match 'policy' => "static_pages#policy", via: [:get] 
match 'makes' => "makes#index", via: [:get]  
match 'make' => "makes#show", via: [:get]  
match 'model_years' => "model_years#index", via: [:get]
match 'model_year' => "model_years#show", via: [:get]
match 'style_detail' => "model_years#details", via: [:get] 
  
  resources :autos, :only => [:index, :show]
  
  resources :songs, :only => [:index, :show]
  
  resources :users, :only => [:show, :index] do
    member do
      get :following 
      get :followers
    end
  end
  resources :locals
  resources :sessions,      only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy] 
  
 resources :movies do
    resources :movie_reviews
 end

  
  resources :podcasts do
   resources :podcast_reviews
    resources :podcast_category do
     resources :podcast_sub_category
   end
  end
  
root 'static_pages#home'
  
end
