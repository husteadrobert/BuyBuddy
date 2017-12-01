class RemoveItemIdFromList < ActiveRecord::Migration[5.1]
  def change
    remove_column :lists, :item_id
  end
end
