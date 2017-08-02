Rails.application.routes.draw do
  get 'ui(/:action)', controller: "ui"

  root to: "pages#landing"

  resources :projects, only: [:create]
  resources :projects, path: "/", only: [:new, :show, :edit, :update]

  resources :tags, only: [:new, :create, :edit, :update]
end
