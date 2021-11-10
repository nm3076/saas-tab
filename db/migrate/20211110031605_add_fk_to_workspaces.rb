class AddFkToWorkspaces < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :workspaces, :users
  end
end
