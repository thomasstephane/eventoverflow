Eventsoverflow::Application.routes.draw do
  resources :events do
    resources :comments, :only => [:show, :create]
  end

  resources :users, :except => [:index] do
  end
  
  get '/login' => 'users#login', :as => :user_login
  post '/login' => 'session#create', :as => :session_create
  root :to => 'events#index'

end
