class BooksController < ApplicationController
  def index
  end

  def show
  end
  
  def booksearch
    client = Openlibrary::Client.new
    @results = client.search(params[:query])
  end
end
