class OrdersController < ApplicationController

  get "/orders/new_order" do
    binding.pry
    erb :"orders/new_order"
  end

  post "/order" do

  end
end
