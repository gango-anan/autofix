class AddGroupIdToExpenditures < ActiveRecord::Migration[6.1]
  def change
    add_column :expenditures, :group_id, :bigint
    add_foreign_key :expenditures, :groups
  end
end
