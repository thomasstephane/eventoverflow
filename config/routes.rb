Eventsoverflow::Application.routes.draw do
  root :to => 'home#index'

  resources :events, :except => :index do
    resources :comments, :only => [:show, :create]
  end

  resource :sessions, :only => [ :new, :create, :destroy]

  resources :users, :except => [:index, :new] do
  end

  # user authentication
  # post '/login' => 'session#create', :as => :session_create
  # get '/logout' => 'session#destroy', :as => :session_destroy

  # homepage
  get '/about' => 'home#about'

end
