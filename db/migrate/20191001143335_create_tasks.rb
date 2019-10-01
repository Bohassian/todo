class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :user, null: false, index: true
      t.string :name, null: false
      t.timestamps
    end
  end
end
