class AddLinksToWorkspaces < ActiveRecord::Migration[6.1]
  def change
    add_reference :links, :workspace
  end
end
