Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/create'
  get 'articles/new'
  get 'articles/show'
  root "home#index"
  resources :articles
  
end
