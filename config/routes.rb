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
