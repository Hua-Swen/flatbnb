Rails.application.routes.draw do
  resources :users, only: :show do
      resources :bookings, only: :index
  end
  devise_for :user
  root to: 'flats#index'
  resources :flats do
    resources :bookings, only: [:show, :new, :create]
    resources :reviews, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
