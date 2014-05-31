OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["FB_KEY"], ENV["FB_SECRET"],{
    :image_size => 'large'
    }
  provider :google_oauth2, ENV["GPLUS_KEY"], ENV["GPLUS_SECRET"],{
      :image_aspect_ratio => "original",
    :image_size => 200
    }
end