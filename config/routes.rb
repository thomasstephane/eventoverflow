Eventsoverflow::Application.routes.draw do
  resources :events do
    resources :comments do
    end
  end
end
