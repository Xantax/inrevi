class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :authorize

  delegate :allow?, to: :current_permission
  helper_method :allow?
  
  include SessionsHelper
  include MediaHelper
  include LocalsHelper
  include BooksHelper
  include PointsHelper
  
  private

    def current_permission
      @current_permission ||= Permission.new(current_user)
    end
    
    def authorize
      if !current_permission.allow?(params[:controller], params[:action])
        redirect_to root_url, notice: "Not authorized."
      end
    end
  
end
