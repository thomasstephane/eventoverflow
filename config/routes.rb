Eventsoverflow::Application.routes.draw do
  root :to => 'home#index'

  resources :events, :except => :index do
    post '/upvote' => 'votes#upvote'
    post '/downvote' => 'votes#downvote'
  end

  resources :comments, :only => [:show, :create] do
    post '/upvote' => 'votes#upvote'
    post '/downvote' => 'votes#downvote'
  end

  resources :users, :except => [:index, :new] do
  end

  post '/login' => 'session#create', :as => :session_create
  get '/logout' => 'session#destroy', :as => :session_destroy

  match '/auth/google_oauth2/callback' => "session#create"
  match '/auth/facebook/callback' => "session#create"
  match '/auth/failure', to: redirect('/')
  match 'signout', to: 'session_destroy', as: 'signout'
end
