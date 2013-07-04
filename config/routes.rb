Enigmates::Application.routes.draw do
  resources :guesses


  resources :attempts


  resources :pieces


  resources :puzzles


  root to: "home#show"
end
