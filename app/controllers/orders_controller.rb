class OrdersController < ApplicationController

  get "/orders/new_order" do
    @drinks = Drink.all
    erb :"orders/new_order"
  end

  post "/order" do
    binding.pry
    @user = User.find_by_id(session[:user_id])
    @order = Order.create(user_id: session[:user_id], favorite: params[:favorite])
    @drinks = params[:drinks]
    @drinks.each do |drink|
      #make an order to get order id
      #make orderdrinks that all link to that order
      # Order.new()
      # Orderdrink.new()
      this_drink = Drink.find_by_id(drink)
      @order_drinks = OrderDrink.new(order_id: @order.id ,drink_id: drink)

    end
    # for params.each do |key, value|
    #   if key == "cappuccino" || key == "latte" || key == "hot coffee" || key == "frozen coffee" || key == "iced coffee"
    #     drink = Drink.create(drink_type: key)
    #     @your_drinks << drink
    #     @orderdrink = OrderDrink.create(order_id: @order.id, drink_id: drink.id)
    #   end
    # @orderdrink
    # @your_drinks
    # endDr
    # @drink.modifications = params[:mods]  ###Needs to be linked to the drink it is for!!!
    erb :"/users/homepage"
  end

  get "/orders/show_order" do
    # @order = Order.find_by_id()
    erb :show_order
  end

  get "/orders/edit_order" do
    erb :"/orders/edit_order"
  end

  get "/orders/:id" do
    erb :"orders/show_order"
  end

end
