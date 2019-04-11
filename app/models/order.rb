class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_drinks
  has_many :drinks, through: :order_drinks
end
