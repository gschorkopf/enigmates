Enigmates::Application.routes.draw do
  resources :pieces


  resources :puzzles


  root to: "home#show"
end
