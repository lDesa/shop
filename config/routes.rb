Rails.application.routes.draw do

  namespace :admin do
    resources :items
  end

  root :to => 'users#index'
  resources :sessions
  resources :users

  get '/login' , to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: "users#new"

end
