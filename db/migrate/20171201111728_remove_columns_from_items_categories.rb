class RemoveColumnsFromItemsCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :category_id
    remove_column :categories, :item_id
  end
end
