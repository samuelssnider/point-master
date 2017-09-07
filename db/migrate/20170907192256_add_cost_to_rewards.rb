class AddCostToRewards < ActiveRecord::Migration[5.1]
  def change
    add_column :rewards, :cost, :integer, default: 1
  end
end
