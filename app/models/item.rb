class Item < ActiveRecord::Base
  has_many :item_categories
  has_many :categories, through: :item_categories
  has_many :lists, through: :item_list
end