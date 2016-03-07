Myflix::Application.routes.draw do
  root to: "pages#front"
  get '/home', to: 'videos#index'
  resources :videos, only: [ :show, :search ] do
    get 'search', on: :collection
  end
  resources :categories, only: [ :show ]
  get 'ui(/:action)', controller: 'ui'
  get 'register', to: "users#new"
  get 'sign_in', to: "sessions#new"
  resources :users, only: [ :create ]
end
