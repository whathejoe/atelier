Rails.application.routes.draw do
  
  root 'products#home'

  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  
  get 'store' => 'products#store'
  get 'store/:id' => 'products#product', as: :product
  
  post 'store/:id' => 'sessions#add_to_cart', as: :add_to_cart
  get 'checkout' => 'sessions#checkout'
  get 'checkout2' => 'sessions#checkout2'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
end
