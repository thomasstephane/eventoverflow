Eventsoverflow::Application.routes.draw do
  root :to => 'home#index'

  resources :events, :except => :index do
    resources :comments, :only => [:show, :create]
  end

  resource :sessions, :only => [ :new, :create, :destroy]
  resources :users, :except => [:index, :new]
  resources :votes, :only => [:create, :destroy]

  # homepage
  get '/about' => 'home#about'

end
