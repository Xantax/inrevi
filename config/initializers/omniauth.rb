OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '204839183038354', 'd3680e6cd20d4b3ff4b4694a9085ea60'
end