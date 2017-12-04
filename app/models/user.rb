class User < ActiveRecord::Base
  has_secure_password

  has_one :list
  has_many :items
  has_many :categories

  validates :username, uniqueness: true, presence: true
end