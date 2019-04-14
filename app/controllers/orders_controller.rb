class OrdersController < ApplicationController

  get "/orders/new_order" do #Go to New Order Page
    @drinks = Drink.all
    erb :"orders/new_order"
  end

  post "/order" do #Create a New Order
    @user = User.find_by_id(session[:user_id])
    @order = Order.create(user_id: session[:user_id], favorite: params[:favorite])
    @drinks = params[:drinks]
    @drinks.each do |drink|
      this_drink = Drink.find_by_id(drink)
      @order_drink = OrderDrink.new(order_id: @order.id ,drink_id: drink)
    end
    erb :"/users/homepage" #Go to User's Index/Homepage
  end

  get "/orders/:id" do #Specific Order Show Page
    @user = User.find_by_id(session[:user_id])
    @order = Order.find_by_id(params[:id])
    @current_order = []
    OrderDrink.all.each do |orderdrink|
      if (orderdrink.order_id).to_i == @order.id
        @current_order << orderdrink
      end
    end
    @current_order
    erb :"/orders/show_order"
  end

  get "/orders/:id/edit" do #Update/Edit Sepcific Order
    @user = User.find_by_id(session[:user_id])
    @order = Order.find_by(user_id: @user.id)
    @drinks = Drink.all
    erb :"/orders/edit_order"
  end

  patch "/orders/:id" do
    binding.pry
    @user = User.find_by_id(session[:user_id]) #Find user
    @order = Order.find_by_id(params[:id]) #Find order through session params
    @orderdrink = OrderDrink.find_by(@user.id) #Find OrderDrink assoc with this user
    old_drink = Drink.find_by_id(@orderdrink.drink_id)
    new_drink = Drink.find_by_id(params[:drinks])
    @orderdrink.drink_id = new_drink.id #Update OrderDrink with New Drink choice!
    @order.favorite = params[:favorite] #Update favorite-ness of OrderDrink record
    @orderdrink.save
    @order.save
    erb :"/users/homepage" #Go to User's Index/Homepage
  end

  get "/orders/:id/delete" do #Delete order and orderdrink from db
    #Find user, order, and orderdrink again
    @user = User.find_by_id(session[:user_id])
    @order = Order.find_by(params[:id])
    @orderdrink = OrderDrink.find_by_id(@order.id)
    #Delete this specific order and orderdrink from database
    @order.destroy
    @orderdrink.destroy
    # binding.pry
    #Send user back to their homepage
    redirect to "/users/homepage"
  end

end
