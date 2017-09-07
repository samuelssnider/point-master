class CreateRewards < ActiveRecord::Migration[5.1]
  def change
    create_table :rewards do |t|
      t.string :title
      t.string :url
      t.references :user, foreign_key: true, default: nil

      t.timestamps
    end
  end
end
