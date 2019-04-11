class User < ActiveRecord::Base
  has_many :orders
  has_many :drinks, through: :orders
  validates :username, presence: true
  validates :password, presence: true
end
