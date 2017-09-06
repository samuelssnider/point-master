Rails.application.routes.draw do
	root to: 'welcome#dashboard'
  resources :users, only: [:new, :create, :show]
end
