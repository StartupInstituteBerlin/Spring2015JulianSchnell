Rails.application.routes.draw do
  devise_for :users
  root to: 'restaurants#index'
  resources :restaurants
  resources :reservations
  get  '/restaurants/:restaurant_id/reservations/new' => 'reservations#new', as:  :new_reservation_for_restaurant
  get 'dashboard', to: 'restaurants#index'
  authenticated :user do
    root to: 'restaurants#index', as: :authenticated_root

  get '/restaurants/:restaurant_id/rating/:value' => "restaurants#rating", as: :rate_restaurant
  end
end
