Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  
  resources :candidate_profiles, only: %i[show new create]
end
