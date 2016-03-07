Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  get '/home', to: 'videos#index'
  resources :videos, only: [ :show, :search ] do
    get 'search', on: :collection
  end
  resources :categories, only: [ :show ]
end
