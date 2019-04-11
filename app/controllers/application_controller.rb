require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  # get "/" do
  #   erb :"users/home"
  # end

  get "/orders/new_order" do
    erb :"orders/new_order"
  end

end
