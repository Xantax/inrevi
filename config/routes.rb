Inrevi::Application.routes.draw do

  resources :tech_reviews

  resources :podcast_reviews
  resources :tvshow_reviews
  resources :movie_reviews
  resources :local_reviews

  get 'techtags/:tag', to: 'teches#index', as: :ttag
  get 'drugtags/:tag', to: 'drugs#index', as: :dtag
  get 'podtags/:tag', to: 'podcasts#index', as: :tag  
  
match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
match 'auth/failure', to: redirect('/'), via: [:get, :post]
match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
match 'songs/search' => "songs#search", via: [:get]
match 'msearch' => "movies#search", via: [:get]
match 'tvsearch' => "tvshows#search", via: [:get]
match 'search' => "books#search", via: [:get]
  
match 'media' => "static_pages#catmedia", via: [:get]
match 'home' => "static_pages#cathome", via: [:get]
match 'beauty' => "static_pages#catbeauty", via: [:get]
match 'fashion' => "static_pages#catfashion", via: [:get]
  
match 'about' => "static_pages#about", via: [:get]
match 'contact' => "static_pages#contact", via: [:get]
match 'tos' => "static_pages#tos", via: [:get]
match 'policy' => "static_pages#policy", via: [:get] 
match 'admin_dashboard' => "static_pages#admin_dashboard", via: [:get]

  
  resources :promotions
  resources :links
  resources :contact_forms 
  resources :activities
  
  resources :users, :only => [:show, :index, :edit, :update] do
    member do
      get :following 
      get :followers
    end
  end
  
  resources :sessions,      only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy] 
  
#----------   LOCAL   ----------  
  
  match 'lsearch' => "locals#lsearch", via: [:get]
  
  resources :locals do
    member do
      get "additionalinfo" => "locals#additionalinfo"
    end
    resources :local_reviews do
      member do
        put "like", to: "local_reviews#upvote"
        put "dislike", to: "local_reviews#downvote"
      end     
    end
  end
  
  match 'local_reviews/all' => "local_reviews#all", via: [:get]
  match 'local_reviews/unpublished' => "local_reviews#unpublished", via: [:get]
  
#----------   HEALTH   ----------
  
  resources :drugs do

  end
  
  resources :supplements do

  end
 
#----------   TECH   ----------  
  
  resources :teches do

  end
 
#----------   AUTO   ----------  
#  resources :auto_reviews
  resources :autos do
    member do
      get "additionalinfo" => "autos#additionalinfo"
    end
    resources :auto_reviews do
      member do
        put "like", to: "auto_reviews#upvote"
        put "dislike", to: "auto_reviews#downvote"
      end     
    end
  end

  match 'auto_reviews/all' => "auto_reviews#all", via: [:get]
  match 'auto_reviews/unpublished' => "auto_reviews#unpublished", via: [:get]

#----------   MEDIA   ----------
  
  resources :songs, :only => [:index, :show] 
  
  resources :books do
    member do
      get "description" => "books#description"
    end
  end
  
  resources :movies do
    resources :movie_reviews do
      member do
        put "like", to: "movie_reviews#upvote"
        put "dislike", to: "movie_reviews#downvote"
      end     
    end
  end

  match 'movie_reviews/all' => "movie_reviews#all", via: [:get]
  match 'movie_reviews/unpublished' => "movie_reviews#unpublished", via: [:get]
  
  resources :tvshows do
    resources :tvshow_reviews do
      member do
        put "like", to: "tvshow_reviews#upvote"
        put "dislike", to: "tvshow_reviews#downvote"
      end     
    end
  end

  match 'tvshow_reviews/all' => "tvshow_reviews#all", via: [:get]
  match 'tvshow_reviews/unpublished' => "tvshow_reviews#unpublished", via: [:get]
  
  resources :podcasts do
    resources :podcast_reviews do
      member do
        put "like", to: "podcast_reviews#upvote"
        put "dislike", to: "podcast_reviews#downvote"
      end     
    end
  end

  match 'podcast_reviews/all' => "podcast_reviews#all", via: [:get]
  match 'podcast_reviews/unpublished' => "podcast_reviews#unpublished", via: [:get]

#----------   END MEDIA   ----------
  
  
root 'static_pages#home'
  
end
