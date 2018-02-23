Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { registrations: "users/registrations"}
  resources :users, only: [:edit, :update, :show]
  # For details on the DSL available within this filegit, see http://guides.rubyonrails.org/routing.html
  resources :items do
    resources :meetings, only: [:new, :create]
  end
  resources :meetings, only: [:edit, :update, :destroy]
  get '/meetings/:id/accept', to: 'meetings#accept', as: :accept_meeting
  get '/meetings/:id/decline', to: 'meetings#decline', as: :decline_meeting
  resources :items do
    resources :dispos, only: [:new, :create]
  end
end

