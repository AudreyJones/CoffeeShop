class Drink < ActiveRecord::Base
  belongs_to :orders
  has_many :users, through :orders
end
