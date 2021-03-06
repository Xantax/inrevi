class Local < ActiveRecord::Base
  has_many :local_reviews
  
  mount_uploader :image, ImageUploader
  
  require 'open-uri'
  require 'json'
  
  class << self
    def factual_results query, params
      
      place = zip_code_or_place_name params[:place].strip
      
      query = build_fatual_query query, params
      page = params[:page] || '1'

      [
        query.select('name', 'region', 'country', 'locality', 'address', 'factual_id', 'tel' , 'category_labels', 'neighborhood', 'website', 'longitude', 'latitude').
          page(page, per: 10).rows,
        query.total_count
      ]
    end

    def partial_params place
      [
        {'region' =>
            {'$search' => place}
        },
        {
          'locality' =>
            {'$search' => place}
        },
        {
          'neighborhood' =>
            {'$search' => place}
        }
      ]
    end
         
    def zip_code_or_place_name places_params
      places_params.to_i > 0 ? ZIP_CODE.find(places_params)['city'] : places_params rescue {"$blank" => false}
    end
    
    def places_params places
      params = [{'postcode' => places}]
      params.concat partial_params places
      places.split(',').each { |place| params.concat partial_params place }

      params
    end

    def params_for_place places
      params = places_params places
      country = Country.find_country_by_name(places)
      params << {'country' => country.alpha2} if country

      params
    end

    def query_by_place places
      {
        '$or' => params_for_place(places)
      }
    end
    
    def query_by_name name
      {
        '$or' => [
          {
            'category_labels' =>
              {'$search' => name}
          },
          {
            'name' =>
              {'$search' => name}
          }
        ]
      }
    end

    def factual_params params
      if params[:place].present? && params[:query].present?
        {
          '$and' => [
            query_by_place(params[:place].strip),
            query_by_name(params[:query].strip)
          ]
        }
      elsif params[:place].present?
        query_by_place(params[:place].strip)
      elsif params[:query].present?
        query_by_name(params[:query].strip)
      else
        {}
      end
    end

    def build_fatual_query query, params
      query.filters factual_params(params)
    end

    def build_params_for_approximately_search local
      {
       'name' => local['name'],
       'latitude' => local['latitude'] || {"$blank" => true},
       'longitude' => local['longitude'] || {"$blank" => true},
       'tel' => local['tel'] || {"$blank" => true},
       'website' => local['website'] || {"$blank" => true}
      }
    end
  end
end