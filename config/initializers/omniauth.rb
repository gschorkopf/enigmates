Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FB_ENIGMATES_ID'], ENV['FB_ENIGMATES_SECRET']
end