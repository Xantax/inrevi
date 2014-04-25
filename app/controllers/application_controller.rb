class ApplicationController < ActionController::Base
  include TheRole::Controller
  include PublicActivity::StoreController
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery
  def access_denied
    flash[:error] = t('the_role.access_denied')
    redirect_to(:back)
  end
  
  include SessionsHelper
  include MediaHelper
  include LocalsHelper
  include BooksHelper
  
end
