Rails.application.routes.draw do
  get 'welcome/home'
  get '/login', to: "sessions#new"
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
