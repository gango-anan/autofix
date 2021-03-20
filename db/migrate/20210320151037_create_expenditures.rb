class CreateExpenditures < ActiveRecord::Migration[6.1]
  def change
    create_table :expenditures do |t|
      t.string :name, null: false
      t.bigint :author_id, null: false
      t.decimal :amount, null: false

      t.timestamps
    end
    add_index :expenditures, :name, unique: true
    add_index :expenditures, :author_id
    add_foreign_key :expenditures, :users, column: :author_id
  end
end
