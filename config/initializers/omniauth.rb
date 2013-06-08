OmniAuth.config.full_host = 'http://localhost:3000'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google, '915798849853.apps.googleusercontent.com', 'iO8OrxnztVC_k-OVnF4N5eY9', { 
      access_type: 'offline',
      scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar',
      redirect_uri:'http://localhost/auth/google_oauth2/callback'
    }
end
