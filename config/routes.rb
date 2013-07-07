Enigmates::Application.routes.draw do
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'
  get '/logout', :to => 'sessions#destroy'
  
  root to: "puzzles#index"
  resources :puzzles, only: [:index, :show] do
    resources :attempts, only: [:show, :create] do
      resources :guesses, only: [:create]
    end
  end
end
