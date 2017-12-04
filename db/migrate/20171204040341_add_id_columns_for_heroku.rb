class AddIdColumnsForHeroku < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories, :user_id
    remove_column :items, :user_id
    remove_column :lists, :user_id
    add_column :categories, :user_id, :integer
    add_column :items, :user_id, :integer
    add_column :lists, :user_id, :integer
  end
end
