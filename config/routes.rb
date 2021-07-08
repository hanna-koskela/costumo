Rails.application.routes.draw do
  # get 'bookings/new'
  # get 'bookings/create'
  # get 'bookings/show'
  # get 'bookings/update'
  # get 'bookings/edit'
  # get 'bookings/destroy'
  # get 'costumes/index'
  # get 'costumes/show'
  devise_for :users
  root to: 'costumes#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :costumes do
    resources :bookings, only: [ :create ]
  end
  resources :bookings

  get "bookings/:id/rating", to: "bookings#rating", as: :edit_rating
  patch "bookings/:id/rating", to: "bookings#rating_update", as: :update_rating

end
