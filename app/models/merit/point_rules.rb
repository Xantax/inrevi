# Be sure to restart your server when you modify this file.
#
# Points are a simple integer value which are given to "meritable" resources
# according to rules in +app/models/merit/point_rules.rb+. They are given on
# actions-triggered, either to the action user or to the method (or array of
# methods) defined in the +:to+ option.
#
# 'score' method may accept a block which evaluates to boolean
# (recieves the object as parameter)

module Merit
  class PointRules
    include Merit::PointRulesMethods

    def initialize
      # score 10, :on => 'users#update' do
      #   user.name.present?
      # end
      #
      score 5, :on => ['auto_reviews#create',
        'local_reviews#create'
        ], category: 'gold_points'
      
      score 2, :on => ['auto_reviews#upvote',
        'local_reviews#upvote'
        ], to: :user, category: 'gold_points'
      
      score 1, :on => ['auto_reviews#upvote', 'auto_reviews#downvote',
        'local_reviews#upvote', 'local_reviews#downvote'
        ], category: 'gold_points'
      
      score 1, :on => ['auto_reviews#create',
        'local_reviews#create'
        ], to: :user, category: 'just_reviews'
      #
      # score 20, :on => [
      #   'comments#create',
      #   'photos#create'
      # ]
    end
  end
end
