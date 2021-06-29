Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/show'
  get 'bookings/update'
  get 'bookings/edit'
  get 'bookings/destroy'
  devise_for :users
  root to: 'costumes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
