Enigmates::Application.routes.draw do
  root to: "puzzles#index"
  resources :puzzles, only: [:index, :show] do
    resources :attempts, only: [:show, :create] do
      resources :guesses, only: [:create]
    end
  end
end
