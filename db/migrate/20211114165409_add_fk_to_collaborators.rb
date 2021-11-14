class AddFkToCollaborators < ActiveRecord::Migration[6.1]
  def change
    add_reference :collaborators, :user, foreign_key: true
    add_reference :collaborators, :workspace, foreign_key: true
    #add_foreign_key :collaborators, :users
    #add_foreign_key :collaborators, :workspaces
  end
end
