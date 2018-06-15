Rails.application.routes.draw do
  get 'welcome/home'
  get '/login', to: "sessions#new"
  get '/auth/google_oauth2/callback', to: "sessions#create_from_google"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :addresses

  resources :routes do
    resources :addresses, only: [:index, :new, :show, :edit]
  end

  resources :users do
    resources :routes, only: [:index, :new, :show, :edit]
  end

  root 'welcome#home'
end
