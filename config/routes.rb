Rails.application.routes.draw do
  get 'costumes/index'
  get 'costumes/show'
  devise_for :users
  root to: 'costumes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
