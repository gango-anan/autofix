class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.bigint :user_id
      t.bigint :expenditure_id
      t.string :icon

      t.timestamps
    end
  end
end
