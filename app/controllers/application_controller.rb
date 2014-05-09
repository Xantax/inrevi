class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include SessionsHelper
  include MediaHelper
  include LocalsHelper
  include BooksHelper
  include PointsHelper
  
  before_filter :authorize
  before_filter :prepare_for_mobile
  
  delegate :allow?, to: :current_permission
  helper_method :allow?
  
  
  private
  
    def mobile_device?
        request.user_agent =~ /Mobile|webOS|iPhone/
    end
    helper_method :mobile_device?
  
    def prepare_for_mobile
      request.format = :mobile if mobile_device?
    end

    def current_permission
      @current_permission ||= Permission.new(current_user)
    end
    
    def authorize
      if !current_permission.allow?(params[:controller], params[:action])
        store_location
        redirect_to root_url, notice: "You need to log in!"
      end
    end
  
end
