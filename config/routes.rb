Rails.application.routes.draw do
  resources :orders, only: [:new, :create]

  get '/dish_counts', to: 'orders#dish_counts'

  root "orders#new"
end
