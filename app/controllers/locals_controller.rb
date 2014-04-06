require 'open-uri'

class LocalsController < ApplicationController
  before_action :factual_authorize
  before_action :promoted_factual, only: [:lsearch]

  def index
    @results = []
    @local_reviews = LocalReview.where(factual_id: params[:id])
  end
  
  def create
    @local = Local.new(factual_id: params[:id])
    @local.save
  end

  def lsearch
    @results, @total_results = Local.factual_results(@query, params)

    respond_to do |format|
      format.html { render 'index' }
    end
  end

  def show
    @local_reviews = LocalReview.where(factual_id: params[:id])
    
    query = @factual.table('places')
    @local = query.filters('factual_id' => params[:id]).first
    
    @vote = LocalVote.find_by_factual_id @local['factual_id']

    alternate_id = alternate_local_id

    if alternate_id
      @alternate_local = query.filters('factual_id' => alternate_id).first
      LocalVote.impression @alternate_local['factual_id']
    end
        
  end

  def additionalinfo
    query = @factual.table('places')
    @local = query.filters('factual_id' => params[:id]).first
    
    other_local @local 
    
    render 'additionalinfo'
  end
  
  private

#  def cat_url
#    begin
#      Nokogiri::XML(open(Settings.cat_api.url)).css("url").text
#    rescue Exception
#      ''
#    end
#  end

  def other_local? local
    factual_query local

    response = @factual.multi(
      hotels_us_query: @hotels_us_query,
      restaurants_us_query: @restaurants_us_query,
      healthcare_providers_us_query: @healthcare_providers_us_query)

    @addition_info = response.select { |key, value| value.count > 0 }.first

#    display_cat_image response
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

  def promoted_factual
    @query = @factual.table('places')
    @promoted_factual = Local.promoted_factual params[:query], params[:place], @query
  end

  def alternate_local_id
    votes_by_city = LocalVote.find_all_by_place(@local['locality'])
    random_vote = votes_by_city
      .select { |vote| longest_common_substr([@local['category_labels'], vote.query]) }
      .reject { |vote| vote.factual_id.eql?(@local['factual_id']) || !vote.live_vote? }
      .sample
    random_vote.factual_id if random_vote
  end

  def longest_common_substr(strings)
    shortest = strings.min_by(&:length)
    maxlen = shortest.length
    maxlen.downto(0) do |len|
      0.upto(maxlen - len) do |start|
        substr = shortest[start,len]
        return substr if strings.all?{|str| str.include? substr }
      end
    end
  end
  
end