Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { registrations: "users/registrations"}
  resources :users, only: [:edit, :update, :show]
  resources :meetings
  # For details on the DSL available within this filegit, see http://guides.rubyonrails.org/routing.html
  resources :items
end
