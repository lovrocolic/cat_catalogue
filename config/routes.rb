Rails.application.routes.draw do
  resources :cats, only: :index
  resources :breeds, only: :index
  root 'home#index'
end
