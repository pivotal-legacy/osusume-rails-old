Rails.application.routes.draw do
	resource :comments, only: :create
	resource :login, only: :create, controller: :login
	resources :restaurants, only: [:index, :create, :show, :update]
end
