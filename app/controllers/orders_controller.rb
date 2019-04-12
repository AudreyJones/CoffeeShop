class OrdersController < ApplicationController

  get "/orders/new_order" do
    erb :"orders/new_order"
  end

  post "/order" do
    @user = User.find_by_id(session[:user_id])
    @order = Order.create(user_id: session[:user_id], favorite: params[:favorite])
    params.each do |key, value|
      if key == "cappuccino" || key == "latte" || key == "hot coffee" || key == "frozen coffee" || key == "iced coffee"
        @drink = Drink.create(drink_type: key)
        @orderdrink = OrderDrink.create(order_id: @order.id, drink_id: @drink.id)
      end
      @drink
      @orderdrink
    end
    @drink.modifications = params[:mods]
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
