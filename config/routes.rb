Rails.application.routes.draw do

  namespace :admin do
    resources :items
  end

  root :to => 'users#index'
  resources :sessions
  resources :users

  get 'login' => 'sessions#new', :as => :login
  post 'logout' => 'sessions#destroy', :as => :logout
  get "signup" => "users#new", :as => "signup"


end
