class EmailLoginsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:email_login][:email].downcase)
    if user && user.authenticate(params[:email_login][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
  
end
