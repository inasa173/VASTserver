Rails.application.routes.draw do
  root to: 'campaigns#index'

  resources :campaigns
  resources :cuepoints
end
