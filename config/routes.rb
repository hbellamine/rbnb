Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :bookings

  resources :users do

    resources :puppies, only: [:new, :create]

  end

  resources :puppies, except:[:new, :create]

end

end
