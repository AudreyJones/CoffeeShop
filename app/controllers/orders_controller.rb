class OrdersController < ApplicationController

  get "/orders/new_order" do
    erb :"orders/new_order"
  end

  post "/order" do
    binding.pry
    
  end
end
