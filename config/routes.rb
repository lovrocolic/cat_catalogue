Rails.application.routes.draw do
  resources :cats, only: %i[index]
  root 'cats#index'
end
