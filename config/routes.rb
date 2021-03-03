Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  
  get "dashboard", to: "users#index"
  resources :candidate_profiles, only: %i[show new create]
  resources :jobs, only: %i[index show new create edit update]
end
