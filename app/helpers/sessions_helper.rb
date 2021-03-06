module SessionsHelper
  
  def current_user?(user)
    user == current_user
  end
  
  def redirect_back_or(default)
    redirect_to((session[:return_to]) || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def signed_in_user
    unless signed_in?
      store_location
      flash[:notice] = "You need to Sign up or Login!"
      redirect_to root_path
    end
  end
  
end