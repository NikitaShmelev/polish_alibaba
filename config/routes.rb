Rails.application.routes.draw do
  # devise_for :users
  # resources :users
  resources :users, :only => [:index, :show]
  get 'users/:id' => 'users#show'

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        confirmations: 'users/confirmations'
      }

  root to: 'home#index'
end
