class OrdersController < ApplicationController

  get "/orders/new_order" do
    erb :"orders/new_order"
  end

  post "/order" do
    @user = User.find_by_id(session[:user_id])
    @order = Order.create(user_id: session[:user_id], favorite: params[:favorite])
    @your_drinks = []
    for params.each do |key, value|
      if key == "cappuccino" || key == "latte" || key == "hot coffee" || key == "frozen coffee" || key == "iced coffee"
        drink = Drink.create(drink_type: key)
        @your_drinks << drink
        @orderdrink = OrderDrink.create(order_id: @order.id, drink_id: drink.id)
      end
    @orderdrink
    @your_drinks
    end
    # @drink.modifications = params[:mods]  ###Needs to be linked to the drink it is for!!!
    # binding.pry
    # OrderDrink.find_by_id()
    erb :"/users/homepage"
  end

  get "/orders/show_order" do
    # @order = Order.find_by_id()
    erb :show_order
  end

  get "/orders/edit_order" do
    erb :"/orders/edit_order"
  end

end
