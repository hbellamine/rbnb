Rails.application.routes.draw do
  get 'users/puppies'
  devise_for :users

  root to: 'pages#home'


  resources :bookings, only: [:index, :destroy, :edit] # list all user bookings


  resources :puppies do
    resources :bookings, only: [:new, :create] # create a booking for a particular puppy
  end

  # get "my_puppies", to ""

  resources :users do

    resources :puppies, only: [:index, :new, :create]

    # post ':id/bookings', to:'bookings#create', as: 'userbookings'

  end

  get 'my_puppies', to: 'puppies#mypuppies' , as: 'usermypuppies'

  # post '/puppies' => 'puppies#create'

end
