class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.timestamps
      t.integer :category_id
      t.string :name
    end
  end
end
