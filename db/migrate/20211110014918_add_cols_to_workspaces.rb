class AddColsToWorkspaces < ActiveRecord::Migration[6.1]
  def change
    add_column :workspaces, :user, :string
    add_column :workspaces, :tags, :string
    add_column :workspaces, :notes, :text
  end
end
