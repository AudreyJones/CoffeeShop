# Your seeds.rb file!
# 1 user and 3 orders and 3 drinks

user1 = User.create(username: "UserOne", email: "one@email.com", password: "PassOne")
user2 = User.create(username: "UserTwo", email: "two@email.com", password: "PassTwo")
user3 = User.create(username: "UserThree", email: "three@email.com", password: "PassThree")

order1 = Order.create(user_id: 1)
order2 = Order.create(user_id: 1, favorite: true)
order3 = Order.create(user_id: 1)

drink1 = Drink.create(drink_type: "Cappuccino", ingredients:"")
drink2  = Drink.create(drink_type: "Iced Coffee", ingredients:"")
drink3 = Drink.create(drink_type: "Hot Coffee", ingredients:"")
drink4 = Drink.create(drink_type: "Americano", ingredients:"")
drink5  = Drink.create(drink_type: "Affogato Espresso", ingredients:"")
drink6 = Drink.create(drink_type: "Espresso Cortado", ingredients:"")
drink7 = Drink.create(drink_type: "Frozen Coffee", ingredients:"")
drink8  = Drink.create(drink_type: "Chai Latte", ingredients:"")
drink9 = Drink.create(drink_type: "Latte", ingredients:"")
drink10 = Drink.create(drink_type: "Macchiato", ingredients:"")

OrderDrink.create(order: order1, drink: drink1)
OrderDrink.create(order: order2, drink: drink2)
OrderDrink.create(order: order3, drink: drink3)
