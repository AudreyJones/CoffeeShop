class OrdersController < ApplicationController

  get "/orders/new_order" do
    erb :"orders/new_order"
  end

  post "/order" do
    binding.pry
    order = Order.new()
    order.save
    binding.pry
  end

  get "/orders/show_order" do
    @order = Order.find_by_id()
    erb :show_order
  end

  get "/orders/edit_order" do
    
  end

end
