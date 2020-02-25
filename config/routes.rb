Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :bookings

  resources :puppies, except:[:new, :create]

  resources :users do

    resources :puppies, only: [:index, :new, :create]
    resources :bookings, only: :index

  end

  post '/puppies' => 'puppies#create'



end

<<<<<<< HEAD
end
#=======
#  resources :puppies do
 #   resources :bookings, only: [:new, :create]
 # end
 # root to: 'pages#home'
#>>>>>>> master
 # get 'users/puppies'
 # get 'users/bookings'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#end
=======

>>>>>>> cc5b145dae7f98d84318e4cf4c1e23bc0a344e61
