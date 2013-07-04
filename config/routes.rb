Enigmates::Application.routes.draw do
  resources :puzzles, only: [:index, :show]
  root to: "puzzles#index"
end
