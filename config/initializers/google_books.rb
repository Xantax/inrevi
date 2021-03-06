module GoogleBooks
  module Comment
    def comments
      BookReview.find_all_by_book_id id
    end
  end
  
  class << self
    def retrieve(id)
      RetrieveResponse.new get(retrieve_url(id).to_s)
    end

    def retrieve_url(id)
      URI::HTTPS.build(:host => 'www.googleapis.com',
                       :path => "/books/v1/volumes/#{id}",
                       :query => "country=ca&key=#{ENV["GOOGLE_KEY"]}"
                      )
    end
  end
  
  class Item
    include GoogleBooks::Comment
  end

class RetrieveResponse
    include Enumerable
    include Comment
    attr_reader :isbn, :id, :isbn_13, :isbn_10

    def initialize(response)
      @response =response.parsed_response

      retrieve_identifier
    end

    def retrieve_identifier
      @id = @response['id']
      begin
        @response['volumeInfo']['industryIdentifiers'].each do |identifier_hash|
          identifier = identifier_hash["identifier"]

          case identifier_hash['type']
          when "ISBN_13"
            @isbn_13 = identifier
          when "ISBN_10"
            @isbn_10 = identifier
          when "OTHER"
            @other_identifier = identifier
          end
        end
      rescue
        nil
      end

      if defined? @isbn_10
        @isbn = @isbn_10
      elsif defined? @isbn_13
        @isbn = @isbn_13
      elsif defined? @other_identifier
        @isbn = @other_identifier
      else
        @isbn = nil
      end
    end

    def method_missing(method_sym, *args, &block)
      @response['volumeInfo'][method_sym.to_s]
    end
  end
end