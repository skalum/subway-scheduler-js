Rails.application.routes.draw do
  get 'welcome/home'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :addresses
  resources :users do
    resources :addresses, only: [:show, :index]
  end

  root 'welcome#home'
end
