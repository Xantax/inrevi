Inrevi::Application.routes.draw do

  resources :reviews

  get 'techtags/:tag', to: 'teches#index', as: :ttag
  get 'drugtags/:tag', to: 'drugs#index', as: :dtag
match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
match 'auth/failure', to: redirect('/'), via: [:get, :post]
match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
match 'songsearch' => "songs#songsearch", via: [:get]
match 'about' => "static_pages#about", via: [:get]
match 'advertising' => "static_pages#advertising", via: [:get]
  match 'localads' => "static_pages#localads", via: [:get]
    match 'localplan1' => "static_pages#localplan1", via: [:get]
    match 'localplan2' => "static_pages#localplan2", via: [:get]
    match 'localplan3' => "static_pages#localplan3", via: [:get]
  match 'techads' => "static_pages#techads", via: [:get]
    match 'techplan1' => "static_pages#techplan1", via: [:get]
    match 'techplan2' => "static_pages#techplan2", via: [:get]
    match 'techplan3' => "static_pages#techplan3", via: [:get]
  match 'autoads' => "static_pages#autoads", via: [:get]
match 'contact' => "static_pages#contact", via: [:get]
match 'tos' => "static_pages#tos", via: [:get]
match 'policy' => "static_pages#policy", via: [:get] 
     
  
  resources :users, :only => [:show, :index] do
    member do
      get :following 
      get :followers
    end
  end
  
  resources :sessions,      only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy] 
  
#----------   LOCAL   ----------  
  
  
  match 'lsearch' => "locals#lsearch", via: [:get]
  post 'vote' => 'votes#create', as: :vote
  
  resources :locals do
    member do
      get "additionalinfo" => "locals#additionalinfo"
    end
  resources :reviews
  end

  
#----------   HEALTH   ----------

scope module: 'health' do  
  
  resources :drugs do
    resources :reviews
  end
  
  resources :supplements do
    resources :reviews
  end
    
end
 
#----------   TECH   ----------  
  
  resources :teches do
    resources :reviews
  end
 
#----------   AUTO   ----------  
  
  resources :autos do
    resources :reviews
  end

#----------   MEDIA   ----------
  
scope module: 'media' do 
  
  get 'podtags/:tag', to: 'podcasts#index', as: :tag  
match 'msearch' => "movies#search", via: [:get]
match 'tvsearch' => "tvshows#search", via: [:get]
match 'search' => "books#search", via: [:get]
  
  resources :media
  
  resources :songs, :only => [:index, :show] 
  
  resources :books do
    resources :reviews
  end
  
  resources :movies do
    resources :reviews
  end
  
  resources :tvshows do
    resources :reviews
  end
  
  resources :podcasts do
    resources :reviews
  end
  
end
  
#----------   END MEDIA   ----------
  
  
root 'static_pages#home'
  
end
