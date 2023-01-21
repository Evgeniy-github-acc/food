Rails.application.routes.draw do
  resources :orders, only: [:new, :create]

  root "orders#new"
end
