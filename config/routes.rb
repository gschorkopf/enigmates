Enigmates::Application.routes.draw do
  get '/login', to: 'sessions#new'
  match '/auth/:provider/callback', to: 'sessions#create'
  match '/auth/failure', to: 'sessions#failure'
  get '/logout', to: 'sessions#destroy'
  
  root to: "puzzles#index"
  resources :puzzles, only: [:index] do
    resources :attempts, only: [:show, :create] do
      post "build_chart", as: "build_chart"
      resources :guesses, only: [:create]
      resources :messages, only: [:create]
    end
  end
  match 'invites/:attempt_id/', to: "invites#create"
end
