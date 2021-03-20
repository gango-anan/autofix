class AddGroupIdToExpenditures < ActiveRecord::Migration[6.1]
  def change
    add_column :expenditures, :group_id, :bigint
  end
end
