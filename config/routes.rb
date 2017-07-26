Rails.application.routes.draw do
  get 'ui(/:action)', controller: "ui"

  if Rails.env.production? 
    root to: "pages#index"
  else
    root to: "ui#index"
  end
end
