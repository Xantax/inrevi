Inrevi::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true
  
  config.action_mailer.default_url_options = { :host => 'dragonstone-rails-69622.euw1.nitrousbox.com' }
  
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
  :authentication => :plain,
  :address => "smtp.mailgun.org",
  :port => 587,
  :domain => "sandboxd079854dfa1b4f558805a1b6f580f47e.mailgun.org",
  :user_name => "postmaster@sandboxd079854dfa1b4f558805a1b6f580f47e.mailgun.org",
  :password => "1dhiceyykgt4"
}

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  BetterErrors::Middleware.allow_ip! '192.168.195.1'
  
  config.paperclip_defaults ={
   :storage => :s3,
   :s3_credentials => {
     :bucket => ENV['AWS_S3_BUCKET'],
     :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
     :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
   }
 }
  
end
