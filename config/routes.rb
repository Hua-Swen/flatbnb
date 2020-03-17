Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  devise_for :hosts
  devise_for :travellers
  root to: 'pages#home'
  resources :flats do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :flats do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
end
