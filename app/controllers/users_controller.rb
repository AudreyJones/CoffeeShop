class UsersController < ApplicationController

# User accesses Sign Up Page, protected view
  get '/signup' do
    if Helpers.is_logged_in?(session) == true
      redirect to "/users/homepage"
    else
      erb :"/users/signup"
    end
  end

# Take User's Sign-Up info and takes them to create their first order (or,
# if info is invalid, user is sent back to try signing up again)!
  post '/signup' do
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      @drinks = Drink.all
      if (@user.username != "") && (@user.email != "") && (@user.password != nil)
        @user.save
        session[:user_id] = @user.id
        erb :"/orders/new_order"
      else
        redirect "/signup"
      end
    end

# User accesses Log In Page
    get '/login' do
      if Helpers.is_logged_in?(session) == true
        redirect to "/users/homepage"
      else
        erb :"/users/login"
      end
    end

    post '/login' do
      @user = User.find_by(username: params[:username])
      session[:user_id] = @user.id
      if Helpers.is_logged_in?(session)
        redirect to "/users/homepage"
      else
        erb :login
      end
    end

    get '/users/logout' do
      erb :"/users/logout"
    end

    get '/logout' do
      # binding.pry
      if Helpers.is_logged_in?(session) == true
        session.destroy
        redirect to "/login"
      else
        redirect to "/home"
      end
    end

    get '/users/homepage' do
      if Helpers.is_logged_in?(session) == true
        @user = User.find_by_id(session[:user_id])
# binding.pry
        erb :"/users/homepage"
      else
        erb  :"/users/login"
      end
    end

end
