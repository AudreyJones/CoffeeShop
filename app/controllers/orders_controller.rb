class OrdersController < ApplicationController

  get "/orders/new_order" do #Go to New Order Page
    @drinks = Drink.all
    erb :"orders/new_order"
  end

  post "/order" do #Create a New Order
#Re-find User and create a new order
    @user = User.find_by_id(session[:user_id])
    @order = Order.create(user_id: session[:user_id], favorite: params[:favorite])
# Access all drinks that make up this order
    @drinks = params[:drinks]
#For each drink ordered, create an OrderDrink to connect them to this Order's ID
    @drinks.each do |drink|
      @order_drink = OrderDrink.create(order_id: @order.id ,drink_id: drink)
      # NOT NEEDED: Find a specific_drink = Drink.find_by_id(drink)
    end
    @order_drink #make these order_drinks accessible outside of the loop
    erb :"/users/homepage" #Go to User's Index/Homepage
  end

  get "/orders/:id" do #Specific Order Show Page
#Re-find User & Order
    @user = User.find_by_id(session[:user_id])
    @order = Order.find_by_id(params[:id])
#Need to find OrderDrinks linked to this Order
    @order_drinks = @order.order_drinks
    erb :"/orders/show_order"
  end

  get "/orders/:id/edit" do #Update/Edit Specific Order
    @user = User.find_by_id(session[:user_id])
    @order = Order.find_by_id(params[:id])
    @drinks = Drink.all
    erb :"/orders/edit_order"
  end

  patch "/orders/:id" do
    @user = User.find_by_id(session[:user_id]) #Find user
    @order = Order.find_by_id(params[:id]) #Find order through session params
    @array = []
    OrderDrink.all.each do |orderdrink|
      if orderdrink.order_id == @order.id
        @array << orderdrink
      end
      @array
    end
    @array
#Create new orderdrinks and associate with current order!
    @drinks = params[:drinks]
    @drinks.each do |drink|
      @orderdrink = OrderDrink.create(order_id: @order.id ,drink_id: drink)
    end
    @orderdrink
    @order.order_drinks.clear #Clear out current order's orderdrinks!
    binding.pry
    @order.favorite = params[:favorite] #Update favorite-ness of OrderDrink record
    # @orderdrink.save
    # @order.save
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
