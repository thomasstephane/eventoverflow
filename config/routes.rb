Eventsoverflow::Application.routes.draw do
  resources :events do
    resources :comments do
    end
  end

  resources :users, :except => [:index] do
  end

  get '/login' => 'users#login', :as => :user_login
end
