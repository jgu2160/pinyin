Rails.application.routes.draw do
  resources :words, only: [:index, :show]
  resources :sentences, only: [:index, :create]
  root to: "sentences#index"
end
