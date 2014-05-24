module Merit
  class PointRules
    include Merit::PointRulesMethods

    def initialize

      score 5, :on => ['auto_reviews#create',
        'local_reviews#create',
        'podcast_reviews#create',
        'tech_reviews#create',
        'movie_reviews#create',
        'tvshow_reviews#create',
        'song_reviews#create',
        'book_reviews#create',
        'recipe_reviews#create',
        'fineart_reviews#create',
        'drug_reviews#create',
        'product_reviews#create'
        
        ], category: 'gold_points'
      
      
      score 2, :on => ['auto_reviews#upvote',
        'local_reviews#upvote',
        'podcast_reviews#upvote',
        'tech_reviews#upvote',
        'movie_reviews#upvote',
        'tvshow_reviews#upvote',
        'song_reviews#upvote',
        'book_reviews#upvote',
        'recipe_reviews#upvote',
        'fineart_reviews#upvote',
        'drug_reviews#upvote',
        'product_reviews#upvote'
        
        ], to: :user, category: 'gold_points'
      
      
      score 1, :on => ['auto_reviews#upvote', 'auto_reviews#downvote',
        'local_reviews#upvote', 'local_reviews#downvote',
        'tech_reviews#upvote', 'tech_reviews#downvote',
        'podcast_reviews#upvote', 'podcast_reviews#downvote',
        'movie_reviews#upvote', 'movie_reviews#downvote',
        'tvshow_reviews#upvote', 'tvshow_reviews#downvote',
        'song_reviews#upvote', 'song_reviews#downvote',
        'book_reviews#upvote', 'book_reviews#downvote',
        'recipe_reviews#upvote', 'recipe_reviews#downvote',
        'fineart_reviews#upvote', 'fineart_reviews#downvote',
        'drug_reviews#upvote', 'drug_reviews#downvote',
        'product_reviews#upvote', 'product_reviews#downvote'
        
        ], category: 'gold_points'
      
      
      
      score 1, :on => ['auto_reviews#create',
        'local_reviews#create',
        'podcast_reviews#create',
        'tech_reviews#create',
        'movie_reviews#create',
        'tvshow_reviews#create',
        'song_reviews#create',
        'book_reviews#create',
        'recipe_reviews#create',
        'fineart_reviews#create',
        'drug_reviews#create',
        'product_reviews#create'
        
        ], to: :user, category: 'just_reviews'

    end
  end
end
