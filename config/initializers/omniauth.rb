
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '915798849853.apps.googleusercontent.com', 'iO8OrxnztVC_k-OVnF4N5eY9', access_type: 'offline',
      scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar',
      redirect_uri:'http://localhost/auth/google_oauth2/callback'
  provider :facebook, '157210444466893', '955b1b4af1a7f070ec542d5b610d15e9'
end
