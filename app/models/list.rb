class List < ActiveRecord::Base
  has_many :item_list
  has_many :items, through: :item_list

  belongs_to :user
end