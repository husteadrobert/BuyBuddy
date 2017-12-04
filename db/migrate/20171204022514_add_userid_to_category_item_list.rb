class AddUseridToCategoryItemList < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :user_id, :string
    add_column :items, :user_id, :string
    add_column :lists, :user_id, :string
  end
end
