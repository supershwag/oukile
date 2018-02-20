Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users, only: [:edit, :update, :show]
  resources :meetings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
