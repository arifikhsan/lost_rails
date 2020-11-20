Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.credentials.google_key, Rails.application.credentials.google_secret # , skip_jwt: true # , scope: 'email,profile,openid'
  # provider :github,        ENV['GITHUB_KEY'],   ENV['GITHUB_SECRET'],   scope: 'email,profile'
  # provider :facebook,      ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  # provider :apple,         ENV['APPLE_CLIENT_ID'], '', { scope: 'email name', team_id: ENV['APPLE_TEAM_ID'], key_id: ENV['APPLE_KEY'], pem: ENV['APPLE_PEM'] }
end
