class OrdersController < ApplicationController

  get "/orders/new_order" do ##Create
    @drinks = Drink.all
    erb :"orders/new_order"
  end

  post "/order" do
    @user = User.find_by_id(session[:user_id])
    @order = Order.create(user_id: session[:user_id], favorite: params[:favorite])
    @drinks = params[:drinks]
    @drinks.each do |drink|
      this_drink = Drink.find_by_id(drink)
      @order_drink = OrderDrink.new(order_id: @order.id ,drink_id: drink)
    end
    erb :"/users/homepage"
  end

  get "/orders/edit_order" do #Update
    @user = User.find_by_id(session[:user_id])
    @order = Order.find_by(user_id: @user.id)
    @drinks = Drink.all
        # binding.pry

    erb :"/orders/edit_order"
  end

  get "/orders/:id" do #Specific Show Page
    @user = User.find_by_id(session[:user_id])
    @order = Order.find_by(user_id: @user.id)
    @current_order = []
    OrderDrink.all.each do |orderdrink|
      if (orderdrink.order_id).to_i == @order.id
        @current_order << orderdrink
      end
    end
    @current_order
    erb :"/orders/show_order"
  end

  post "/orders/:id" do
    # binding.pry
    @user = User.find_by_id(session[:user_id])
    @order = Order.find_by_id(params[:id])
  end

  post "/orders/:id/delete" do
    @user = User.find_by_id(session[:user_id])
    @order = Order.find_by(user_id: @user.id)
    @order.destroy
    redirect to "/users/homepage"
  end

end
