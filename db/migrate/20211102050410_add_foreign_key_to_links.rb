class AddForeignKeyToLinks < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :links, :workspaces
  end
end
