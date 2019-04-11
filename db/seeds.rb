# Your seeds.rb file!
# 1 user and 3 orders and 3 drinks

user1 = User.create(username: "UserOne", email: "one@email.com", password: "PassOne")
user2 = User.create(username: "UserTwo", email: "two@email.com", password: "PassTwo")
user3 = User.create(username: "UserThree", email: "three@email.com", password: "PassThree")

order1 = Order.create(user_id: 1)
order2 = Order.create(user_id: 2, favorite: true)
order3 = Order.create(user_id: 3)

drink1 = Drink.create(drink_type: "Cappuccino", ingredients:"blah", modifications: "Dry")
drink2  = Drink.create(drink_type: "Iced Coffee", ingredients:"blah", modifications: "Extra Cream")
drink3 = Drink.create(drink_type: "Hot Coffee", ingredients:"blah", modifications: "with Vanilla")

OrderDrink.create(order: order2, drink: drink3)
OrderDrink.create(order: order3, drink: drink1)
OrderDrink.create(order: order2, drink: drink2)
