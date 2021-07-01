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

  resources :costumes
  resources :bookings

end
