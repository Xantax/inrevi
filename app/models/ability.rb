class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
       if user.admin?
         can [:update], [User]
         can [:destroy, :all], [AutoReview, BookReview, DrugReview, FineartReview, LocalReview, MovieReview, PodcastReview, ProductReview, RecipeReview, SongReview, TechReview, TvshowReview]
         can [:update, :all, :edit, :destroy], [Auto, Drug, Fineart, Podcast, Recipe, Tech]
         can [:update, :edit, :destroy, :index], [ContactForm, Promotion, Link]
       elsif user.company?
         #...
       end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/bryanrite/cancancan/wiki/Defining-Abilities
  end
end
