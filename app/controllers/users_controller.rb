class UsersController < ApplicationController

  get '/signup' do
    if Helpers.is_logged_in?(session) == true
      redirect to "/homepage"
    else
      erb :"/users/signup"
    end
  end

  post '/signup' do
      user = User.new(username: params[:username], email: params[:email], password: params[:password])
      if (user.username != "") && (user.email != "") && (user.password != nil)
        user.save
        session[:user_id] = user.id
        redirect to "/homepage"
      else
        redirect "/signup"
      end
    end

    get '/login' do
      if Helpers.is_logged_in?(session) == true
        redirect to "/tweets"
      else
        erb :login
      end
    end

    post '/login' do
      @user = User.find_by(username: params[:username])
      session[:user_id] = @user.id
      if Helpers.is_logged_in?(session)
        redirect to "tweets"
      else
        erb :login
      end
    end

    get '/logout' do
      # binding.pry
      if Helpers.is_logged_in?(session) == true
        session.destroy
        redirect to "/login"
      else
        redirect to "/homepage"
      end
    end

end
