Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  resources :cats, only: :index
  resources :breeds, only: :index
  root 'home#index'
end
