class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :author_id
      t.string :icon

      t.timestamps
    end

    add_foreign_key :categories, :users, column: :author_id
    add_index :categories, :author_id
    
  end
end
