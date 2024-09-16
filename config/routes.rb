Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    patch '/users/:id', to: 'users/registrations#update'
  end


  root to: "events#index"
  resources :events, only: [:index, :new, :create, :show, :edit, :update] do
  end

  resources :users, only: [:show]

  resources :events do
    resources :messages, only: [:create]
  end

end
