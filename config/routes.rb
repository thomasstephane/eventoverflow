Eventsoverflow::Application.routes.draw do
  root :to => 'home#index'

  resources :events, :except => :index do
    resources :comments, :only => [:show, :create]
  end

  resources :users, :except => [:index, :new] do
  end

  # user authentication
  post '/login' => 'session#create', :as => :session_create

  # homepage
  get '/about' => 'home#about'

end
