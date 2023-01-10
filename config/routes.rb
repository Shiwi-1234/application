Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/create'
  get 'articles/new'
  get 'articles/show'
  devise_for :users
  root "home#index"
  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
