module SessionsHelper

  def current_user?(user)
    user == current_user
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to root_path, notice: "Please log in."
    end
  end
  
end