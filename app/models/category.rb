class Category < ActiveRecord::Base
  include Slugable

  has_many :item_categories
  has_many :items, through: :item_categories

  validates :name, presence: true, uniqueness: true

  set_slugable_column :name
end