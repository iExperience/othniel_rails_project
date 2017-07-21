Rails.application.routes.draw do
#	get "users/new"
#  get 'logout', to: 'users#logout'
	
	concern :commentable do
		resources :comments, only: [:new, :create, :destroy]
	end
	resources :users, concerns: :commentable do
		resources :groups
		resources :comments
	end

	resources :groups, concerns: :commentable

	root "sessions#new"

	match '/logout', to: 'sessions#destroy', via: 'delete'
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
