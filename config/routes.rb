Rails.application.routes.draw do
  resources :rents
  resources :vehicles
  resources :users
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
