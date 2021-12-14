class CreateCollaborations < ActiveRecord::Migration[6.1]
  def change
    create_table :collaborations do |t|
      t.integer :user_id
      t.integer :workspace_id
      t.string :role
      t.timestamps
    end
  end
end
