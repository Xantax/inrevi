class Book < ActiveRecord::Base
  has_many :book_reviews
  
  CATEGORY = {intitle: "by title", inauthor: "by author", subject: "by category", isbn: "by isbn"}.freeze
  PER_PAGE = 10

  class << self
    def search(params)
      GoogleBooks.search(search_param(params[:category], params[:query]), {:count => PER_PAGE, :page => page(params), :api_key => Settings.google.api, :country => "ca" })
    end

    def page(params)
      params[:page].present? ? params[:page].to_i : 1
    end

    def search_param(category, query)
      if category
        "#{category}:#{query}"
      else
        query
      end
    end
    
  end
  
end
