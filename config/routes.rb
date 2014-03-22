Inrevi::Application.routes.draw do

  get 'podtags/:tag', to: 'podcasts#index', as: :tag
  get 'techtags/:tag', to: 'teches#index', as: :ttag
  get 'drugtags/:tag', to: 'drugs#index', as: :dtag
match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
match 'auth/failure', to: redirect('/'), via: [:get, :post]
match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
match 'msearch' => "movies#search", via: [:get]
match 'tvsearch' => "tvshows#search", via: [:get]
match 'search' => "books#search", via: [:get]
match 'lsearch' => "locals#lsearch", via: [:get]
match 'songsearch' => "songs#songsearch", via: [:get]
match 'about' => "static_pages#about", via: [:get]
match 'advertising' => "static_pages#advertising", via: [:get]
match 'contact' => "static_pages#contact", via: [:get]
match 'careers' => "static_pages#careers", via: [:get]
match 'tos' => "static_pages#tos", via: [:get]
match 'policy' => "static_pages#policy", via: [:get] 
     
  resources :songs, :only => [:index, :show] 
  
  resources :users, :only => [:show, :index] do
    member do
      get :following 
      get :followers
    end
  end
  
  resources :locals do
    member do
      get "additionalinfo" => "locals#additionalinfo"
    end
    resources :local_reviews
  end
  
  
  resources :sessions,      only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy] 
 
  resources :drugs do
    resources :drug_reviews
  end
  
  resources :teches do
    resources :tech_reviews
  end

scope module: 'media' do 
  
  resources :media
  
  resources :books do
  end
  
  resources :movies do
    resources :movie_reviews
  end
  
  resources :tvshows do
    resources :tvshow_reviews
  end
  
  resources :podcasts do
    resources :podcast_reviews
  end
  
end
  
  resources :autos do
    resources :auto_reviews
  end
  
root 'static_pages#home'
  
end
