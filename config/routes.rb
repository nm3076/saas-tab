
Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'workspaces#index'

  resources :workspaces
  resources :users
  resources :collaborations
  
  get 'dashboard', to: 'workspaces#index'
  get 'signup', to: 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  #routes for modifying user workspace
  delete 'delete_link_from_workspace/:id', to: 'workspaces#delete_link_from_workspace', as: 'delete_link_from_workspace'
  get 'open_links/:id', to: 'workspaces#open_links', as: 'open_links'
  match 'add_link_to_workspace/:id' => 'workspaces#add_link_to_workspace', via: :post


end
