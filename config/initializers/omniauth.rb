Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['OAUTH_KEY'], ENV['OAUTH_SECRET']
end
