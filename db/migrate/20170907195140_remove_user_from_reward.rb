class RemoveUserFromReward < ActiveRecord::Migration[5.1]
  def change
    remove_reference :rewards, :user, foreign_key: true
  end
end
