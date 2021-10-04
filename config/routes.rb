Rails.application.routes.draw do
  
  
  get 'carts/show'
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
  
  # resources :cart
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"
  resources :products
  resources :orders
  resources :categories
  resources :sub_categories
  
  namespace :admin do
    resources :users
    resources :categories
    resources :sub_categories
    resources :orders
    resources :product
  end
  
end
