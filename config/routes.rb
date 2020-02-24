Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :bookings

  resources :users do

    resources :puppies, only: [:new, :create]

  end

  resources :puppies, except:[:new, :create]


  get 'users/puppies'

  get 'users/bookings'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
