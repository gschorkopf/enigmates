Enigmates::Application.routes.draw do
  resources :puzzles
  root to: "puzzles#show"
end
