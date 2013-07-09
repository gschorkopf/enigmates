if Rails.env.production?  
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, ENV['TWITTER_ENIGMATES_ID_production'], ENV['TWITTER_ENIGMATES_SECRET_production']
    provider :facebook, ENV['FB_ENIGMATES_ID_production'], ENV['FB_ENIGMATES_SECRET_production']
    provider :google_oauth2, ENV["GOOGLE_ENIGMATES_ID_production"], ENV["GOOGLE_ENIGMATES_SECRET_production"]
  end
else
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, ENV['TWITTER_ENIGMATES_ID_development'], ENV['TWITTER_ENIGMATES_SECRET_development']
    provider :facebook, ENV['FB_ENIGMATES_ID_development'], ENV['FB_ENIGMATES_SECRET_development']
    provider :google_oauth2, ENV["GOOGLE_ENIGMATES_ID_development"], ENV["GOOGLE_ENIGMATES_SECRET_development"]
  end
end