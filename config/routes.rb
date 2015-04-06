Rails.application.routes.draw do
  resources :words, only: [:index, :show]
  resources :sentences, only: [:index, :create]
  get "/delete", to: "sentences#destroy"
  root to: "sentences#index"
end
