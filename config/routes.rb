Eventsoverflow::Application.routes.draw do
  resources :events do
    resources :comments do
    end
  end

  resources :users, :except => [:index] do
  end
end
