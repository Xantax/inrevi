class AutosController < ApplicationController
  include AutoModelYearsHelper
  
  before_filter :condition
  
  def index
  end
  
  def condition
    if params[:type].present?
      session[:condition] = params[:type]
    else
      unless session[:condition].present?
        session[:condition] = "NEW"
      end
    end
  end
  
  
end
