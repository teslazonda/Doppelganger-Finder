Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :doppelganger, only: %i[index new create show] do
    resources :booking, only: %i[new create]
  end
  resources :booking, only: %w[update]
end
