class ChangeUseridToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :categories, :user_id, :integer
    change_column :items, :user_id, :integer
    change_column :lists, :user_id, :integer
  end
end
