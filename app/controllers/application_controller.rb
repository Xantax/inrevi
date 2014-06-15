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

  before_filter :prepare_for_mobile
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :provider
    devise_parameter_sanitizer.for(:sign_up) << :image
    devise_parameter_sanitizer.for(:sign_up) << :remote_image_url
  end
  
  private
  
    def mobile_device?
        request.user_agent =~ /Mobile|webOS|iPad/
    end
    helper_method :mobile_device?
  
    def prepare_for_mobile
      request.format = :mobile if mobile_device?
    end
  
end
