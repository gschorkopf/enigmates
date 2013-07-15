Enigmates::Application.routes.draw do
  get '/login', to: 'sessions#new'
  match '/auth/:provider/callback', to: 'sessions#create'
  match '/auth/failure', to: 'sessions#failure'
  get '/logout', to: 'sessions#destroy'
  
  root to: "puzzles#index"
  resources :puzzles, only: [:index] do
    resources :attempts, only: [:show, :create] do
      resources :guesses, only: [:create]
    end
  end

  resources :messages, only: [:create]
  match 'invites/:attempt_id/', to: "invites#create"
end
