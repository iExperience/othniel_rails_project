Rails.application.routes.draw do
#	get "users/new"
#  get 'logout', to: 'users#logout'
	
	concern :commentable do
		resources :membership, :comments, only: [:new, :create, :destroy]
	end
	resources :users, concerns: :commentable do
		resources :groups
		resources :comments
	end

	resources :groups, concerns: :commentable
	
	match '/logout', to: 'sessions#destroy', via: 'delete'
	#match '/join', to: 'memberships#join', via: 'post'

	root "sessions#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
