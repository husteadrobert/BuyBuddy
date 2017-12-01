class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
      t.integer :item_id
    end
  end
end
