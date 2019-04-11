# Your seeds.rb file!
# 1 user and 3 orders and 3 drinks

user1 = User.new(username: "UserOne", email: "one@email.com", password: "PassOne")
user2 = User.new(username: "UserTwo", email: "two@email.com", password: "PassTwo")
user3 = User.new(username: "UserThree", email: "three@email.com", password: "PassThree")

order1 = Order.new(user_id: 1, drinks: "Cappuccino\, Latte")
order2 = Order.new(user_id: 2, drinks: "Latte\, Frozen Coffee")
order3 = Order.new(user_id: 3, drinks: "Iced Coffee\, Macchiato")

drink1 = Drink.new(type: "Cappuccino", modifications: "Dry")
drink2  = Drink.new(type: "Iced Coffee", modifications: "Extra Cream")
drink3 = Drink.new(type: "Hot Coffee", modifications: "with Vanilla")
