Rails.application.routes.draw do
  
  
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        confirmations: 'users/confirmations'
      }
  get 'users/:id' => 'users#show'
  resources :users, :only => [:show]

  devise_for :campaigns, controllers: {
        sessions: 'campaigns/sessions',
        registrations: 'campaigns/registrations',
        confirmations: 'campaigns/confirmations'
      }
  get 'campaigns/:id' => 'campaigns#show'
  resources :campaigns, :only => [:show]

  get '/learn_more' => 'help#lear_more_campaign', :as => 'learn_more'

  root to: 'home#index'
  
  resources :cart
  resources :products
  resources :orders
  resources :categories
  resources :sub_categories
end
