Rails.application.routes.draw do
  root "home#index"
  resources :users, only: [:new, :create, :show]
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit'
  patch 'password', to: 'passwords#update', as: :edit_password
  resources :groups
  resources :expenditures
end
