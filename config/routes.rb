Rails.application.routes.draw do
  resources :maps
  root "maps#index"
end
