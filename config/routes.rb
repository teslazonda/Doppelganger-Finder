Rails.application.routes.draw do
  namespace :owner do
    get 'bookings/index'
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :doppelgangers, only: %i[index new create show] do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[index update]
  namespace :owner do
    resources :bookings, only: %i[index update]
  end
end
