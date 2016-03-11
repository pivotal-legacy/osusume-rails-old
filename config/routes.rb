Rails.application.routes.draw do
  resources :login, only: :create
  get '/profile', to: 'profile#show'
  get '/profile/posts', to: 'profile#index'
  resources :restaurants, only: [:index, :create, :show, :update] do
    resources :comments, only: :create
  end
  resources :cuisines
end
