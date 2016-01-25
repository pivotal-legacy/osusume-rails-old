Rails.application.routes.draw do
  resources :restaurants, only: [:index, :create, :show, :update]
  resource :login, only: :create, controller: :login
end
