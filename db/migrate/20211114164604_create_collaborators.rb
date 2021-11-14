class CreateCollaborators < ActiveRecord::Migration[6.1]
  def change
    create_table :collaborators do |t|
      t.string :collaborator_name
      t.string :owner_name
      t.string :workspace_name

      t.timestamps
    end
  end
end
