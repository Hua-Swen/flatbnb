Rails.application.routes.draw do
  devise_for :user
  root to: 'pages#home'
  resources :flats do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
