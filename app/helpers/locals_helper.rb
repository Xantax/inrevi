module LocalsHelper
  
  def max_pages results_count
    max = Places::FREE_ACC_ROW_LIMIT/ Places::FREE_ACC_QUERY_LIMIT
    page_results = (results_count.to_f / Places::FREE_ACC_QUERY_LIMIT).ceil

    page_results > max ? max : page_results
  end

  def country_name region
    country = Country.find_country_by_alpha2(region)

    country ? country : region
  end

  def select_params
    ['hours', 'website', 'name', 'country', 'language', 'locality', 'address', 'factual_id', 'region', 'tel', 'category_ids', 'category_labels', 'latitude', 'longitude']
  end
  
end
