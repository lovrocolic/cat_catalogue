Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  resources :cats, only: %i[index destroy]
  resources :breeds, only: %i[index destroy]
  root 'home#index'
end
