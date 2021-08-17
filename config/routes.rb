Rails.application.routes.draw do
  devise_for :users
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/update'
  get 'doppelgangers/index'
  get 'doppelgangers/new'
  get 'doppelgangers/create'
  get 'doppelgangers/show'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :doppelganger, only: %i[index new create show] do
    resources :booking, only: %i[new create]
  end
  resources :booking, only: %i[update]
end
