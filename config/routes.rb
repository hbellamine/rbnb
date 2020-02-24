Rails.application.routes.draw do
  devise_for :users
  get 'bookings/index'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/show'
  get 'bookings/update'
  get 'bookings/destroy'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/update'
  get 'users/destroy'
  get 'puppies/index'
  get 'puppies/new'
  get 'puppies/create'
  get 'puppies/show'
  get 'puppies/update'
  get 'puppies/destroy'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
