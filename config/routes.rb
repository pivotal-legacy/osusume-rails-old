Rails.application.routes.draw do
  resources :login, only: :create
  get '/profile', to: 'profile#show'
  resources :restaurants, only: [:index, :create, :show, :update] do
    resources :comments, only: :create
  end
  resources :cuisines
end
