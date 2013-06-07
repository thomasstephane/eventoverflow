OmniAuth.config.full_host = 'http://localhost:3000'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google, '1055639787275-k9l9ncve01am7vlp3iu5hf4aec27gtba.apps.googleusercontent.com', 'co2XW-B1tzUuzUB63uB4W10P'
end
