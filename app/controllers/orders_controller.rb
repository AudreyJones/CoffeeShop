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
    @order.order_drinks.clear #clears order_id from related orderdrinks

#Create new orderdrinks and associate with current order! (Functionally replacing them)
    @drinks = params[:drinks] # Returns an array of drink_id's
    @drinks.each do |drink| # Iterate over the array and take each drink_id...
      @orderdrink = OrderDrink.create(order_id: @order.id ,drink_id: drink) #....and create a new orderdrink that is associated w/ the order!
    end
    @orderdrink
    @order.favorite = params[:favorite] #Update favorite-ness of OrderDrink record
    @order.save
    erb :"/users/homepage" #Go to User's Index/Homepage to show new updated order in User's index!
  end

  get "/orders/:id/delete" do #Delete order and orderdrink from db
    #Find user, order, and orderdrink again
    @user = User.find_by_id(session[:user_id])
    order = Order.find_by_id(params[:id])
    orderdrinks = @order.order_drinks
    orderdrinks.destroy
    # @order.order_drinks.clear #rids association to orderdrinks and specific drinks
    # @user.orders.clear #rids association to User
    order.destroy
    # binding.pry
    # binding.pry
    #Send user back to their homepage
    redirect to "/users/homepage"
  end

end
