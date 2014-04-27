Inrevi::Application.routes.draw do

  get 'techtags/:tag', to: 'teches#index', as: :ttag
  get 'drugtags/:tag', to: 'drugs#index', as: :dtag
  get 'podtags/:tag', to: 'podcasts#index', as: :tag  
  
match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
match 'auth/failure', to: redirect('/'), via: [:get, :post]
match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
match 'songsearch' => "songs#songsearch", via: [:get]
match 'msearch' => "movies#search", via: [:get]
match 'tvsearch' => "tvshows#search", via: [:get]
match 'booksearch' => "books#search", via: [:get]
  
match 'media' => "static_pages#catmedia", via: [:get]
match 'home' => "static_pages#cathome", via: [:get]
match 'beauty' => "static_pages#catbeauty", via: [:get]
match 'fashion' => "static_pages#catfashion", via: [:get]
  
match 'about' => "static_pages#about", via: [:get]
match 'contact' => "static_pages#contact", via: [:get]
match 'tos' => "static_pages#tos", via: [:get]
match 'policy' => "static_pages#policy", via: [:get] 
  
  resources :contact_forms 
  resources :activities
  
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
  post 'vote' => 'votes#create', as: :local_vote
  
  resources :locals do
    member do
      get "additionalinfo" => "locals#additionalinfo"
    end
  resources :local_reviews
  end
  
#----------   HEALTH   ----------
  
  resources :drugs do
    resources :reviews
  end
  
  resources :supplements do
    resources :reviews
  end
 
#----------   TECH   ----------  
  
  resources :teches do
    resources :reviews
  end
 
#----------   AUTO   ----------  
  
  resources :autos do
    member do
      get "additionalinfo" => "autos#additionalinfo"
    end
    resources :auto_reviews do
      member do
        put "like", to: "auto_reviews#upvote"
        put "dislike", to: "auto_reviews#downvote"
      end
      
        resources :auto_review_reports
        resources :reports      
    end
  end

#----------   MEDIA   ----------
  
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

#----------   END MEDIA   ----------
  
  
root 'static_pages#home'
  
end
