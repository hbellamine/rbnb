Rails.application.routes.draw do
  devise_for :users
  resources :puppies do
    resources :bookings, only: [:new, :create]
  end
  root to: 'pages#home'
  get 'users/puppies'
  get 'users/bookings'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
