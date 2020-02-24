Rails.application.routes.draw do
  devise_for :users
#<<<<<<< indexlist
  root to: 'pages#home'

  resources :bookings

  resources :users do

    resources :puppies, only: [:new, :create]

  end

  resources :puppies, except:[:new, :create]


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
