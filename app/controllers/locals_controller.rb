class LocalsController < ApplicationController
  before_action :factual_authorize, only: [:index, :lsearch, :show, :additionalinfo]
  before_action :signed_in_user, except: [:show, :index, :lsearch]

  def index
    @results = []
    @local_reviews = LocalReview.where(local_id: params[:id]).paginate(:page => params[:page], :per_page => 15)
  end

  def lsearch
    query = @factual.table('places')
    @results, @total_results = Local.factual_results(query, params)
    render 'index'    
  end

  def show    
    query = @factual.table('places')
    @local = query.filters('factual_id' => params[:id]).first
    
    other_local @local
    
    @local_reviews = LocalReview.where(local_id: params[:id]).paginate(:page => params[:page], :per_page => 15).order("cached_votes_score DESC")
    
    @avg_score = 0
    @avg_score = @local_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @local_reviews.count if @local_reviews.count > 0    
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
      @factual = Factual.new(ENV["FACTUAL_KEY"], ENV["FACTUAL_SECRET"])
    end
end