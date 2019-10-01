class CreateListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :list_items do |t|
      t.belongs_to :task, null: false, index: true
      t.string :description, null: false
      t.integer :priority, null: false
      t.boolean :complete, null: false, default: false
      t.timestamps
    end
  end
end
