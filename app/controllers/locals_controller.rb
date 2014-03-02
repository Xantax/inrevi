class LocalsController < ApplicationController
before_action :factual_authorize, only: [:index, :lsearch, :show]

  def index
    @results = []
  end

  def lsearch
    query = @factual.table('places')
    @results = Local.fatual_results(query, params).first

    respond_to do |format|
      format.html { render 'index' }
    end
  end

  def show
    query = @factual.table('places')
    @local = query.filters('factual_id' => params[:id]).first
    
  end

  private
    def factual_authorize
      @factual = Factual.new("eXMwUZMBIrfW7ORstKjqxoZelkYRMmOwi6C7lRDt", "htInMeU5AXUHdPuErx27W1MIj9MYeYzsG6DhhSV6")
    end
end
