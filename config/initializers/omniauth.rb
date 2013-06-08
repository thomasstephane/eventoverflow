Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '505165056299.apps.googleusercontent.com', '-mtekIF2JdwwOmzZqwysKR-R'
end