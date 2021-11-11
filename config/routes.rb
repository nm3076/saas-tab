Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'workspaces#login'

  resources :workspaces
  
  delete 'delete_link_from_workspace/:id', to: 'workspaces#delete_link_from_workspace', as: 'delete_link_from_workspace'
  
  get 'go_to_workspaces', to: 'workspaces#index'
  get 'go_to_register', to: 'workspaces#register'
  get 'go_to_login', to: 'workspaces#login'

  get 'open_links/:id', to: 'workspaces#open_links', as: 'open_links'
  # get '/workspace_links', to: 'workspace#workspace_links', as: 'workspace_links'

  #get 'add_link_to_workspace/:id', to: 'workspaces#add_link_to_workspace', as: 'add_link_to_workspace'
  match 'add_link_to_workspace/:id' => 'workspaces#add_link_to_workspace', via: :post
end
