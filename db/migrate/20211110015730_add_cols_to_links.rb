class AddColsToLinks < ActiveRecord::Migration[6.1]
  def change
    add_column :links, :nickname, :string
    add_column :links, :open_on_click, :boolean
    add_column :links, :notes, :text
  end
end
