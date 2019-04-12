class Drink < ActiveRecord::Base
  has_many :order_drinks
  has_many :orders, through: :order_drinks
  has_many :users, through: :orders
  attr_accessor :ingredients
  def make_drink
    case drink_type
      when "cappuccino"
        @drink.ingredients = "two shots of espresso, half steamed milk, half foam"
      when "latte"
        @drink.ingredients = "two shots of espresso, half steamed milk, dollop of foam"
      when "hot coffee"
        @drink.ingredients = "ground coffee beans brewed with piping hot water"
      when "frozen coffee"
        @drink.ingredients = "coffee or espresso blended with milk and ice until smooth"
      when "iced coffee"
        @drink.ingredients = "fresh, double-strength brewed coffee, chilled, and served over ice"
    end
  end
end
