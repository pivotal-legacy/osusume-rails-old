Rails.application.routes.draw do
  resources :login, only: :create
  resources :restaurants, only: [:index, :create, :show, :update] do
    resources :comments, only: :create
  end
  resources :cuisines
end
