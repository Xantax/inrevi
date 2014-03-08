class LocalsController < ApplicationController
before_action :factual_authorize, only: [:index, :lsearch, :show]

  def index
    @results = []    
  end

  def lsearch
    query = @factual.table('places')
    @results, @total_results = Local.factual_results(query, params)
    
    respond_to do |format|
      format.html { render 'index' }
    end    
  end

  def show
    query = @factual.table('places')
    @local = query.filters('factual_id' => params[:id]).first
    
    other_local @local 
  end

  private
  
  def other_local local
    factual_query local

    response = @factual.multi(
      hotels_us_query: @hotels_us_query,
      restaurants_us_query: @restaurants_us_query,
      healthcare_providers_us_query: @healthcare_providers_us_query)

    @addition_info = response.select { |key, value| value.count > 0 }.first
  end

  def factual_query local
    %W(hotels-us restaurants-us healthcare-providers-us).each do |table|
      instance_variable_set "@#{table.underscore}_query",
        @factual.table(table).filters(
          Local.build_params_for_approximately_search(local))
    end
  end
  
    def factual_authorize
      @factual = Factual.new("eXMwUZMBIrfW7ORstKjqxoZelkYRMmOwi6C7lRDt", "htInMeU5AXUHdPuErx27W1MIj9MYeYzsG6DhhSV6")
    end
end
