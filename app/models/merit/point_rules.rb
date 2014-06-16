module Merit
  class PointRules
    include Merit::PointRulesMethods

    def initialize           
      
      score 1, :on => ['auto_reviews#upvote',
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
        
        ], to: :user, category: 'votes'

    end
  end
end
