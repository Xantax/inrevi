Inrevi::Application.routes.draw do

  resources :alerts

  resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end
  end
  match 'all_product_reviews' => "product_reviews#all", via: [:get]

  get 'cameras/search' => 'products#search'
  get 'computers/search' => 'products#search'
  get 'securits/search' => 'products#search'
  get 'televisions/search' => 'products#search'
  get 'carelectros/search' => 'products#search'
  get 'homeaudios/search' => 'products#search'
  get 'eportables/search' => 'products#search'
  get 'emobiles/search' => 'products#search'
  get 'videogames/search' => 'products#search'
  get 'makeups/search' => 'products#search'
  get 'fragrances/search' => 'products#search'
  get 'haircares/search' => 'products#search'
  get 'skincares/search' => 'products#search'
  get 'bodybaths/search' => 'products#search'
  get 'grocers/search' => 'products#search'
  get 'jewelrs/search' => 'products#search'
  get 'healthcares/search' => 'products#search'
  get 'supplements/search' => 'products#search'
  get 'sexuals/search' => 'products#search'
  get 'personals/search' => 'products#search'
  get 'musicals/search' => 'products#search'
  get 'sports/search' => 'products#search'
  get 'crafts/search' => 'products#search'
  get 'toys/search' => 'products#search'
  get 'appliances/search' => 'products#search'
  get 'kids/search' => 'products#search'
  get 'pets/search' => 'products#search'
  get 'tools/search' => 'products#search'
  get 'indoors/search' => 'products#search'
  get 'outdoors/search' => 'products#search'
  get 'ereaders/search' => 'products#search'
  get 'enavigations/search' => 'products#search'
  get 'ewars/search' => 'products#search'
  get 'beatools/search' => 'products#search'
  get 'footwears/search' => 'products#search'
  get 'clothings/search' => 'products#search'
  get 'medicals/search' => 'products#search'
  get 'households/search' => 'products#search'
  get 'hkids/search' => 'products#search'
  get 'vehcars/search' => 'products#search'
  
  resources :products, path: 'computers', as: :computer do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'cameras', as: :camera do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'securits', as: :securit do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'televisions', as: :television do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'carelectros', as: :carelectro do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'homeaudios', as: :homeaudio do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'eportables', as: :eportable do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'emobiles', as: :emobile do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'videogames', as: :videogame do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'makeups', as: :makeup do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'fragrances', as: :fragrance do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'haircares', as: :haircare do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'skincares', as: :skincare do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'bodybaths', as: :bodybath do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'grocers', as: :grocer do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'jewelrs', as: :jewelr do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'healthcares', as: :healthcare do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'supplements', as: :supplement do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'sexuals', as: :sexual do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'personals', as: :personal do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'musicals', as: :musical do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'sports', as: :sport do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'crafts', as: :craft do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'toys', as: :toy do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'appliances', as: :appliance do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'kids', as: :kid do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'pets', as: :pet do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'tools', as: :tool do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'indoors', as: :indoor do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'outdoors', as: :outdoor do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'ereaders', as: :ereader do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end  
  resources :products, path: 'enavigations', as: :enavigation do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end  
  resources :products, path: 'ewars', as: :ewar do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end 
  resources :products, path: 'beatools', as: :beatool do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end  
  resources :products, path: 'footwears', as: :footwear do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'clothings', as: :clothing do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'medicals', as: :medical do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end  
  resources :products, path: 'households', as: :household do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  resources :products, path: 'hkids', as: :hkid do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end 
  resources :products, path: 'vehcars', as: :vehcar do
    resources :product_reviews do
       member do
         put "like", to: "product_reviews#upvote"
         put "dislike", to: "product_reviews#downvote"
      end      
    end
  end
  

#  get 'tags/:tag', to: 'teches#index', as: :ttag
#  get 'tags/:tag', to: 'podcasts#index', as: :tag  
#  get 'tags/:tag', to: 'recipes#index', as: :rtag
#  get 'tags/:tag', to: 'finearts#index', as: :atag
  
#match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
#match 'auth/failure', to: redirect('/'), via: [:get, :post]
  
match 'songs/search' => "songs#search", via: [:get]
match 'msearch' => "movies#search", via: [:get]
match 'tvsearch' => "tvshows#search", via: [:get]
match 'search' => "books#search", via: [:get]
match 'drugs/search' => "drugs#search", via: [:get]
match 'autos/search' => "autos#search", via: [:get]
match 'teches/search' => "teches#search", via: [:get]
match 'podcasts/search' => "podcasts#search", via: [:get]
match 'recipes/search' => "recipes#search", via: [:get]
match 'finearts/search' => "finearts#search", via: [:get]
  
match 'media' => "static_pages#catmedia", via: [:get]
match 'home' => "static_pages#cathome", via: [:get]
match 'beauty' => "static_pages#catbeauty", via: [:get]
match 'fashion' => "static_pages#catfashion", via: [:get]
  match 'fashion/clothing' => "static_pages#catfashion_clothing", via: [:get]
  match 'fashion/footwear' => "static_pages#catfashion_footwear", via: [:get]
match 'hobbies' => "static_pages#cathobbies", via: [:get]
match 'electronics' => "static_pages#catelectronics", via: [:get]
match 'health' => "static_pages#cathealth", via: [:get]
match 'sustenance' => "static_pages#catsustenance", via: [:get]
  
match 'about' => "static_pages#about", via: [:get]
match 'contact' => "static_pages#contact", via: [:get]
match 'tos' => "static_pages#tos", via: [:get]
match 'policy' => "static_pages#policy", via: [:get] 
match 'admin_dashboard' => "static_pages#admin_dashboard", via: [:get]

    resources :links
  resources :contact_forms 
  resources :activities
  
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  
  match '/users/:id', :to => 'users#show', :as => :user, via: [:get]
  resources :users, only: [:edit, :update]
  match 'users/:id/followers', :to => "users#followers", :as => "followers", via: [:get]
  match 'users/:id/following', :to => "users#following", :as => "following", via: [:get]
  
  get 'sign_in', :to => 'users/sessions#new', :as => :new_session
  
  resources :relationships, only: [:create, :destroy] 
  
#----------   LOCAL   ----------  
  
  match 'lsearch' => "locals#lsearch", via: [:get]
  
  resources :locals do
    resources :local_reviews do
      member do
        put "like", to: "local_reviews#upvote"
        put "dislike", to: "local_reviews#downvote"
      end     
    end
  end
  
  match 'all_local_reviews' => "local_reviews#all", via: [:get]
  
#----------   HEALTH   ----------
  
  resources :drugs do
    resources :drug_reviews do
      member do
        put "like", to: "drug_reviews#upvote"
        put "dislike", to: "drug_reviews#downvote"
      end     
    end
  end
  
  match 'all_drugs' => "drugs#all", via: [:get]
  match 'all_drug_reviews' => "drug_reviews#all", via: [:get]
 
 
#----------   TECH   ----------  
  
  resources :teches do
    resources :tech_reviews do
      member do
        put "like", to: "tech_reviews#upvote"
        put "dislike", to: "tech_reviews#downvote"
      end     
    end
  end
  
  match 'all_tech' => "teches#all", via: [:get]
  match 'all_tech_reviews' => "tech_reviews#all", via: [:get]
 
#----------   AUTO   ----------  
  
  resources :autos do
    resources :auto_reviews do
      member do
        put "like", to: "auto_reviews#upvote"
        put "dislike", to: "auto_reviews#downvote"
      end     
    end
  end
  
  match 'all_vehicle' => "autos#all", via: [:get]
  match 'all_auto_reviews' => "auto_reviews#all", via: [:get]

#----------   MEDIA   ----------
  
  resources :songs, :only => [:index, :show] do
    resources :song_reviews do
      member do
        put "like", to: "song_reviews#upvote"
        put "dislike", to: "song_reviews#downvote"
      end     
    end
  end

  match 'all_song_reviews' => "song_reviews#all", via: [:get]


  resources :books do
    resources :book_reviews do
      member do
        put "like", to: "book_reviews#upvote"
        put "dislike", to: "book_reviews#downvote"
      end     
    end
  end

  match 'all_book_reviews' => "book_reviews#all", via: [:get]
  
  resources :movies do
    resources :movie_reviews do
      member do
        put "like", to: "movie_reviews#upvote"
        put "dislike", to: "movie_reviews#downvote"
      end     
    end
  end

  match 'all_movie_reviews' => "movie_reviews#all", via: [:get]
  
  resources :tvshows do
    resources :tvshow_reviews do
      member do
        put "like", to: "tvshow_reviews#upvote"
        put "dislike", to: "tvshow_reviews#downvote"
      end     
    end
  end

  match 'all_tvshow_reviews' => "tvshow_reviews#all", via: [:get]
  
  resources :podcasts do
    resources :podcast_reviews do
      member do
        put "like", to: "podcast_reviews#upvote"
        put "dislike", to: "podcast_reviews#downvote"
      end     
    end
  end

  match 'all_podcasts' => "podcasts#all", via: [:get]
  match 'all_podcast_reviews' => "podcast_reviews#all", via: [:get]
  
  
  resources :finearts do
    resources :fineart_reviews do
      member do
        put "like", to: "fineart_reviews#upvote"
        put "dislike", to: "fineart_reviews#downvote"
      end     
    end
  end

  match 'all_finearts' => "finearts#all", via: [:get]
  match 'all_fineart_reviews' => "fineart_reviews#all", via: [:get]  

#----------   END MEDIA   ----------
  
#----------   RECIPE   ----------#  
  
  resources :recipes  do
    resources :recipe_reviews do
      member do
        put "like", to: "recipe_reviews#upvote"
        put "dislike", to: "recipe_reviews#downvote"
      end     
    end
  end

  match 'all_recipes' => "recipes#all", via: [:get]
  match 'all_recipe_reviews' => "recipe_reviews#all", via: [:get]
  
#----------   MOBILE  ----------#
 
  match 'mobile_newsfeed' => "static_pages#mobile_newsfeed", via: [:get]  
  
  match '*path' => redirect('/'), via: :get
  
root 'static_pages#home'
  
  
end
