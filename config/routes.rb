Rails.application.routes.draw do
  
  resources :orders, :new => { :express => :get }

  root 'products#home'

  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  
  get 'store' => 'products#store'
  get 'store/:id' => 'products#product', as: :product
  
  post 'store/:id' => 'sessions#add_to_cart', as: :add_to_cart
  get 'cart' => 'sessions#cart'
  get 'clear_cart' => 'sessions#clear_cart'

  post 'payment' => 'orders#new'
  get 'payment' => 'orders#new' 
  get 'express_payment' => 'orders#express'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

end
