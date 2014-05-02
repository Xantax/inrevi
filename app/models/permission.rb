class Permission < Struct.new(:user)
  def allow?(controller, action)
    return true if controller == "sessions"
    return true if controller == "static_pages" && action != "admin_dashboard"
    return true if controller == "books"
    return true if controller == "users" && action.in?(%w[show])
    return true if controller == "auto_reviews" && action.in?(%w[index])
    return true if controller == "autos" && action.in?(%w[index show])
    if !user.banned?
      return true if controller == "auto_reviews" && action.in?(%w[new create])
      return true if controller == "locals" && action.in?(%w[index])
      return true if controller == "users" && action.in?(%w[edit update])
      return true if user.admin?
    end
    false
  end
end



