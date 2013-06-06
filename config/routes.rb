Eventsoverflow::Application.routes.draw do
  root :to => 'home#index'

  resources :events, :except => :index do
    resources :comments, :only => [:show, :create]
  end

  resource :sessions, :only => [ :new, :create, :destroy]
  resources :users, :except => [:index, :new]
  resources :votes, :only => [:create]

  # homepage
  get '/about' => 'home#about'

  post '/events/vote'   => 'events#vote'
  post '/comments/vote' => 'comments#vote'
end
