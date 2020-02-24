Rails.application.routes.draw do
  devise_for :users
<<<<<<< HEAD
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
  get 'puppies/new'
  get 'puppies/create'
  get 'puppies/index'

  get 'puppies/show'
  get 'puppies/update'
  get 'puppies/destroy'
=======
  # get 'bookings/index'
  # get 'bookings/new'
  # get 'bookings/create'
  # get 'bookings/show'
  # get 'bookings/update'
  # get 'bookings/destroy'
  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  # get 'users/update'
  # get 'users/destroy'
  # get 'puppies/index'
  # get 'puppies/new'
  # get 'puppies/create'
  # get 'puppies/show'
  # get 'puppies/update'
  # get 'puppies/destroy'
>>>>>>> 33e4df7602550d517132ed9119fe4d28aec6d409
  root to: 'pages#home'

  resources :puppies

  resources :bookings

  resources :users

  get 'users/puppies'

  get 'users/bookings'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
