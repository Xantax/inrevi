class Permission < Struct.new(:user)
  def allow?(controller, action)
    return true if controller == "sessions"
    return true if controller == "static_pages" && action != "admin_dashboard"
    return true if controller == "books"
    return true if controller == "songs"
    return true if controller == "locals"
    return true if controller == "movies"
    return true if controller == "tvshows"
    return true if controller == "autos" && action.in?(%w[index show])
    return true if controller == "recipes" && action.in?(%w[index show search])
    return true if controller == "autos" && action.in?(%w[index show search])
    return true if controller == "finearts" && action.in?(%w[index show search])
    return true if controller == "drugs" && action.in?(%w[index show search])
    return true if controller == "teches" && action.in?(%w[index show search])
    return true if controller == "users" && action.in?(%w[show following followers])
    return true if controller == "contact_forms" && action.in?(%w[new create])
    return true if controller == "auto_reviews" && action.in?(%w[show])
    return true if controller == "podcast_reviews" && action.in?(%w[show])
    return true if controller == "tech_reviews" && action.in?(%w[show])
    return true if controller == "movie_reviews" && action.in?(%w[show])
    return true if controller == "tvshow_reviews" && action.in?(%w[show])
    return true if controller == "song_reviews" && action.in?(%w[show])
    return true if controller == "local_reviews" && action.in?(%w[show])
    return true if controller == "book_reviews" && action.in?(%w[show])
    return true if controller == "drug_reviews" && action.in?(%w[show])
    return true if controller == "recipe_reviews" && action.in?(%w[show])
    return true if controller == "fineart_reviews" && action.in?(%w[show])
    return true if controller == "product_reviews" && action.in?(%w[show])
    if user
      return true if user.admin?
      return false if user.banned?
      if user.moderator?
        return true if controller == "autos" && action.in?(%w[edit update destroy all]) 
        return true if controller == "recipes" && action.in?(%w[edit update destroy all])
        return true if controller == "podcasts" && action.in?(%w[edit update destroy all])
        return true if controller == "finearts" && action.in?(%w[edit update destroy all])
        return true if controller == "drugs" && action.in?(%w[edit update destroy all]) 
        return true if controller == "teches" && action.in?(%w[edit update destroy all])  
      end
      return true if controller == "autos" && action.in?(%w[new create search])
      return true if controller == "podcasts" && action.in?(%w[new create search])
      return true if controller == "drugs" && action.in?(%w[new create search])
      return true if controller == "recipes" && action.in?(%w[new create search])
      return true if controller == "finearts" && action.in?(%w[new create search])
      return true if controller == "teches" && action.in?(%w[new create search])
      return true if controller == "relationships" && action.in?(%w[create destroy])
      return true if controller == "auto_reviews" && action.in?(%w[new create upvote downvote])
      return true if controller == "local_reviews" && action.in?(%w[new create upvote downvote])
      return true if controller == "song_reviews" && action.in?(%w[new create upvote downvote])
      return true if controller == "tech_reviews" && action.in?(%w[new create upvote downvote])
      return true if controller == "movie_reviews" && action.in?(%w[new create upvote downvote])
      return true if controller == "tvshow_reviews" && action.in?(%w[new create upvote downvote])
      return true if controller == "podcast_reviews" && action.in?(%w[new create upvote downvote])
      return true if controller == "book_reviews" && action.in?(%w[new create upvote downvote])
      return true if controller == "drug_reviews" && action.in?(%w[new create upvote downvote])
      return true if controller == "recipe_reviews" && action.in?(%w[new create upvote downvote])
      return true if controller == "fineart_reviews" && action.in?(%w[new create upvote downvote])
      return true if controller == "product_reviews" && action.in?(%w[new create upvote downvote])
    end
    false
  end
end


