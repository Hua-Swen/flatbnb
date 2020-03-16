Rails.application.routes.draw do
  devise_for :hosts
  devise_for :travellers
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
