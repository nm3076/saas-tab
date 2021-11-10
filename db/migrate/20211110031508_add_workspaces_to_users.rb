class AddWorkspacesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :workspaces, :user
  end
end
