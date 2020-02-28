Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'users/puppies'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: 'pages#home'



  resources :bookings, only: [:index, :destroy, :edit] # list all user bookings

  resources :reviews, only: [:new, :create]

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
