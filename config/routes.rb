Rails.application.routes.draw do
  
  root 'products#home'
  
  get 'store' => 'products#store'
  get 'store/:id' => 'products#product', as: :product
  
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'add_to_cart/:id' => 'sessions#add_to_cart', as: :add_to_cartx
  post 'add_to_cart/:id' => 'sessions#add_to_cart', as: :add_to_cart
  get 'checkout' => 'sessions#checkout'
  post 'store/:id' => 'session#add_to_cart', as: :add_to_carto
  
  get 'checkout2' => 'sessions#checkout2'

end
