Enigmates::Application.routes.draw do
  root to: "puzzles#index"
  resources :puzzles, only: [:index, :show] do
    resources :attempts, only: [:show, :create]
  end
end
