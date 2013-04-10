CanaryCanary::Application.routes.draw do

  get "products/show"

  mount Piggybak::Engine => '/checkout', :as => 'piggybak'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  resources :categories
  resources :products
  match "/search" => "products#search"
end