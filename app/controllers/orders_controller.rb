class OrdersController < ApplicationController

  get "/orders/new_order" do
    erb :"orders/new_order"
  end

  post "/order" do
    binding.pry
    @user = User.find_by_id(session[:user_id])
    order = Order.new(user_id: session[:user_id], favorite: params[:favorite])
    order.save
  end

  get "/orders/show_order" do
    @order = Order.find_by_id()
    erb :show_order
  end

  get "/orders/edit_order" do
    erb :"/orders/edit_order"
  end

end
