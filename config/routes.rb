Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users

  root to: "events#index"
  resources :events, only: [:index, :new, :create, :show, :edit, :update] do
  end

  resources :users, only: [:show]

  resources :events do
    resources :messages, only: [:create]
  end

end
