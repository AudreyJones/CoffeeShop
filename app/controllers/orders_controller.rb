class OrdersController < ApplicationController

  get "/orders/new_order" do
    @drinks = Drink.all
    erb :"orders/new_order"
  end

  post "/order" do
    @user = User.find_by_id(session[:user_id])
    @order = Order.create(user_id: session[:user_id], favorite: params[:favorite])
    @drinks = params[:drinks]
    @drinks.each do |drink|
      #make an order to get order id -DONE
      #make orderdrinks that all link to that order
      # Order.new()
      # Orderdrink.new()
      this_drink = Drink.find_by_id(drink)
      @order_drink = OrderDrink.new(order_id: @order.id ,drink_id: drink)
    end
    erb :"/users/homepage"
  end

  get "/orders/edit_order" do
    erb :"/orders/edit_order"
  end

  get "/orders/:id" do
    @user = User.find_by_id(session[:user_id])
    @order = Order.find_by_id(params[:id])
    @current_order = []
    OrderDrink.all.each do |orderdrink|
      if (orderdrink.order_id).to_i == @order.id
        @current_order << orderdrink
      end
    end
    @current_order #Works!!!
      # binding.pry
    erb :"orders/show_order"
  end

end
