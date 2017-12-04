class Category < ActiveRecord::Base
  include Slugable

  has_many :item_categories
  has_many :items, through: :item_categories

  belongs_to :user

  validates :name, presence: true
  
  set_slugable_column :name
end