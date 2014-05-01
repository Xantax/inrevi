OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '204839183038354', 'd3680e6cd20d4b3ff4b4694a9085ea60',{
    :image_size => 'large'
    }
  provider :google_oauth2, '459957410335-233cfn4j6cbkqisf8r86fcmcigarp75l.apps.googleusercontent.com', 'UTMdeEFQbIGInkmjOqcAWgVM',{
      :image_aspect_ratio => "original",
      :image_size => 250
    }
end