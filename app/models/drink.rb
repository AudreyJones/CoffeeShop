class Drink < ActiveRecord::Base
  has_many :order_drinks
  has_many :orders, through: :order_drinks
  has_many :users, through: :orders
end
