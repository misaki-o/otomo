Rails.application.routes.draw do
  get 'users/show'
  devise_for :users

  root to: "events#index"
  resources :events, only: [:index, :new, :create]
  resources :users, only: [:show]

end
