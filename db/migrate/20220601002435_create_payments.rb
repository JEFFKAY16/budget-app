class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :name
      t.integer :author_id
      t.integer :amount

      t.timestamps
    end

    add_foreign_key :payments, :users, column: :author_id
    add_index :payments, :author_id

  end
end
