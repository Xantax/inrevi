class SessionsController < ApplicationController
  
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_back_or(root_path)
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out."
    redirect_back_or(root_path)
  end
end