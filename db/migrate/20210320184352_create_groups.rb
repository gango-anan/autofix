class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.bigint :user_id
      t.bigint :expenditure_id
      t.string :icon

      t.timestamps
    end
    add_index :groups, :name, unique: true
    add_foreign_key :groups, :expenditures
    add_foreign_key :groups, :users
  end
end
