Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  
  root 'categories#index'

  get '/signup' => "users#new"
  post '/users' => "users#create"

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  get '/logout' => "sessions#destroy"
  
  resources :categories
  resources :questions do
    get '/random' => "questions#random"
    post '/random' => "questions#put_answer"
    get '/results_page' => "questions#results_page"
  end
  resources :scores

end
