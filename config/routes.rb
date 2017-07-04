Rails.application.routes.draw do
  get 'results/index'

  get 'results/record'

  root to: 'campaigns#index'

  resources :campaigns
  resources :cuepoints do
    resources :campaigns, only: :index
  end
end
