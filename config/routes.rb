Rails.application.routes.draw do
  get 'ui(/:action)', controller: "ui"

  root to: "pages#index"

  resources :projects, only: [:create]
  resources :projects, path: "/", only: [:new, :show, :edit, :update]
end
