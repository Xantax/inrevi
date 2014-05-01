module GoogleBooks
  
  class << self
    def retrieve(id)
      RetrieveResponse.new get(retrieve_url(id).to_s)
    end

    def retrieve_url(id)
      URI::HTTPS.build(:host => 'www.googleapis.com',
                       :path => "/books/v1/volumes/#{id}"
                      )
    end
  end

  class RetrieveResponse
    include Enumerable

    def initialize(response)
      @response = response['volumeInfo']
    end

    def method_missing(method_sym, *args, &block)
      @response[method_sym.to_s] ||= {}
    end
  end
end