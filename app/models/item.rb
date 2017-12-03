class Item < ActiveRecord::Base
  include Slugable

  has_many :item_categories
  has_many :categories, through: :item_categories
  has_many :lists, through: :item_list

  validates :name, presence: true, uniqueness: true

  set_slugable_column :name
end