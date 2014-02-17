class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :content
      t.integer :project_id

      t.timestamps
    end
    add_index :statuses, :project_id
  end
end
