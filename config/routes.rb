Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :bookings

  resources :puppies, except:[:new, :create]

  resources :users do

    resources :puppies, only: [:new, :create]

  end

  post '/puppies' => 'puppies#create'



end


