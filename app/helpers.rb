class Helpers
  def self.current_user(session)
    @current_user = User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    session[:user_id] != nil ? true : false
  end

  #Make_drink is here
  def make_drink(drink)
    case @drink.drink_type
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
