Rails.application.routes.draw do
# resources :order_items
  # get 'addtocart#show'
  get 'home/index'
  get 'carts/adddata'
  resources :carts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'carts#index'

  post "carts/add_to_cart/:id", to: "carts#add_to_cart", as: "add_to_cart"
  delete "carts/remove_from_cart/:id", to: "carts#remove_from_cart", as: "remove_from_cart"

end
