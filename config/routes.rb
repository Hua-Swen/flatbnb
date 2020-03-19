Rails.application.routes.draw do
  get 'user/show'
  devise_for :user
  root to: 'flats#index'
  resources :flats do
    resources :bookings, only: [:show, :new, :create]
    resources :reviews, only: [:new, :create]
    123
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
