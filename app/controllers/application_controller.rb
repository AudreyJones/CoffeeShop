require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
    # register Sinatra::Flash
  end

  get "/" do
    @user = User.find_by_id(session[:user_id])
    if @user != nil && Helpers.is_logged_in?(session) == true
      erb :"/users/homepage"
    else
      erb  :"/home"
    end
  end
end
