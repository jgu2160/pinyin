Rails.application.routes.draw do
  resources :words, only: [:index, :show]
  resources :sentences, only: [:index]
  root to: "words#index"
end
