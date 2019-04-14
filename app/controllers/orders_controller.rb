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
# binding.pry
    @current_order = []
    # binding.pry
    OrderDrink.all.each do |orderdrink|
      # binding.pry
      if (orderdrink.order_id).to_i == @order.id
        @current_order << orderdrink
      end
    end
    @current_order
    # binding.pry
    erb :"/orders/show_order"
  end

  get "/orders/:id/edit" do #Update/Edit Sepcific Order
    @user = User.find_by_id(session[:user_id])
    @order = Order.find_by(user_id: @user.id)
    @drinks = Drink.all
    erb :"/orders/edit_order"
  end

  patch "/orders/:id" do
#params => {"_method"=>"patch",
 # "drinks"=>["2"],
 # "favorite"=>"false",
 # "submit"=>"Update my Order!",
 # "id"=>"4"}
    @user = User.find_by_id(session[:user_id]) #Find user
    @order = Order.find_by_id(params[:id]) #Find order through session params
# binding.pry
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
