Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'workspaces#index'

  resources :workspaces
  delete 'delete_link_from_workspace/:id', to: 'workspaces#delete_link_from_workspace', as: 'delete_link_from_workspace'
  #get 'add_link_to_workspace/:id', to: 'workspaces#add_link_to_workspace', as: 'add_link_to_workspace'
  match 'add_link_to_workspace/:id' => 'workspaces#add_link_to_workspace', via: :post
end
