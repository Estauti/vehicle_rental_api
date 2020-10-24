Rails.application.routes.draw do
  resources :rents
  resources :vehicles do
    collection do
      get :brands
      get :brand_models
    end
  end
  resources :users
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
