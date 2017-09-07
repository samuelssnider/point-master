Rails.application.routes.draw do
	root to: 'welcome#dashboard'
	get "login" => "sessions#new", :as => "login"
	delete "/logout", to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show, :index] do
		resources :points, only: [:new, :show]
	end
	resources :sessions, only: [:new, :create, :show]
end