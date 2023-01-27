Rails.application.routes.draw do
  get 'categories/index'
  devise_for :clients
  root "home#index"
  resources :categories do
    resources :articles
  end
end
