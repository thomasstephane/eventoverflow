OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '505165056299.apps.googleusercontent.com', '-mtekIF2JdwwOmzZqwysKR-R'
  provider :facebook, '157210444466893', '955b1b4af1a7f070ec542d5b610d15e9'
end