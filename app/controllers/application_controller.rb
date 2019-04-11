require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
    # register Sinatra::Flash
  end

  # get "/" do
  #   erb :"users/home"
  # end

  get "/orders/new_order" do
    # flash[:message] = "a string"
    # binding.pry
    erb :"orders/new_order"
  end

end
