class AddRedemToPoints < ActiveRecord::Migration[5.1]
  def change
    add_column :points, :redeemed, :boolean, default: 'false'
  end
end
