Rails.application.routes.draw do
  resources :places
  devise_for :admins
  root to: "home#index"
end
