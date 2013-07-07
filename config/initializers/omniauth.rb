Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_ENIGMATES_ID'], ENV['TWITTER_ENIGMATES_SECRET']
  provider :facebook, ENV['FB_ENIGMATES_ID'], ENV['FB_ENIGMATES_SECRET']
  provider :google_oauth2, ENV["GOOGLE_ENIGMATES_ID"], ENV["GOOGLE_ENIGMATES_SECRET"]
end