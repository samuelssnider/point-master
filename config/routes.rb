Rails.application.routes.draw do
	root to: 'welcome#dashboard'
	get "login" => "sessions#new", :as => "login"
	delete "/logout", to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show, :index, :update, :edit] do
		resources :points, only: [:new, :show, :create]
	end
	resources :sessions, only: [:new, :create, :show]
	resources :rewards, only: [:index, :new, :create, :update, :show]
end
