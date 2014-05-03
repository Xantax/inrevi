
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
    ['hours_display',
      
      'cuisine', 'payment_cashonly', 'reservations', 'attire', 'parking', 'smoking', 'meal_breakfast', 'meal_lunch', 'meal_dinner',
     'meal_takeout', 'meal_cater', 'alcohol', 'kids_menu', 'accessible_wheelchair', 'seating_outdoor', 'wifi', '', 
      'room_private', 'options_vegetarian', 'options_vegan', 'options_glutenfree', 'options_organic', 'options_healthy',
      
      'degrees', 'insurances', 'years_experience', 'affiliations', 'languages', 'education', 'email', 
      
      'air_conditioning', 'complimentary_breakfast', 'lowest_price', 'highest_price', 'deposit', 'room_count', 'stars', 
      'pets', 'non_smoking_rooms', 'smoking', 'internet', 'fitness_facilities', 'check_in', 'check_out', 
      'express_check_in', 'express_check_out', 'laundry_service', 'cable_tv', 'accessibility', 'spa_services',
      'cribs', 'concierge', 'twentyfour_hour_front_desk', 'meeting_rooms', 'banquet_facilities', 'event_catering',
      'type', 'roll_out_beds'
      ]
  end
  
  def lat_long_places results
    results.map { |result| [result['latitude'], result['longitude'], result['name']] }
  end
  
end
