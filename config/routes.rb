Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: %i[new create]
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit'
  patch 'password', to: 'passwords#update', as: :edit_password
  resources :groups, except: %i[edit update]
  resources :expenditures, only: %i[index new create]
  get 'external_expenditures', to: 'expenditures#other_expenditures'
end
