Enigmates::Application.routes.draw do
  resources :puzzles


  root to: "home#show"
end
