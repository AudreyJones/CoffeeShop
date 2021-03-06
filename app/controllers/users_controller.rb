class UsersController < ApplicationController

# User accesses Sign Up Page, protected view
  get '/signup' do
    @user = User.find_by_id(session[:user_id])
    # binding.pry
    if @user == nil
      erb :"/users/signup"
    elsif @user != nil && Helpers.is_logged_in?(session) == true
      redirect to "/users/homepage"
    elsif @user != nil && Helpers.is_logged_in?(session) == false
      erb :"/users/login"
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
      # binding.pry
      @user = User.find_by_id(session[:user_id])
      if @user != nil && Helpers.is_logged_in?(session) == true
        redirect to "/users/homepage"
      else
        erb :"/users/login"
      end
    end

    post '/login' do
      @user = User.find_by(username: params[:username])
      # binding.pry
      if @user != nil && Helpers.is_logged_in?(session)
        session[:user_id] = @user.id
        redirect to "/users/homepage"
      else
        erb :"/users/signup"
      end
    end

    get '/users/logout' do
      erb :"/users/logout"
    end

    get '/logout' do
      @user = User.find_by_id(session[:user_id])
      # binding.pry
      if @user != nil && Helpers.is_logged_in?(session) == true
        session.clear
        redirect to "/login"
      else
        redirect to "/"
      end
    end

    get '/users/homepage' do
      @user = User.find_by_id(session[:user_id])
      if @user != nil && Helpers.is_logged_in?(session) == true
        erb :"/users/homepage"
      else
        erb  :"/users/login"
      end
    end

    get '/users/:id/edit_account' do
      @user = User.find_by_id(session[:user_id])
      if @user != nil && Helpers.is_logged_in?(session) == true
        erb :"/users/edit_account"
      else
        erb  :"/users/login"
      end
    end

    patch '/users/:id/edit_account' do
      @user = User.find_by_id(session[:user_id]) #Re-find User to update
      #Update User info based on edit_account's input
      @user.username = params[:username]
      @user.password = params[:password]
      @user.email = params[:email]
      @user.save
      if @user != nil && Helpers.is_logged_in?(session) == true
        erb :"/users/updated_account"
      else
        redirect to "/"
      end
    end

    get '/users/:id/terminate_account' do
      @user = User.find_by_id(session[:user_id])
      if @user != nil && Helpers.is_logged_in?(session) == true
        erb :"/users/terminate_account" #take User to terminate_account page
      else
        redirect to "/" #take User to home to signup or login
      end
    end

    get '/users/delete_account' do
      @user = User.find_by_id(session[:user_id]) #Re-find User
  # binding.pry
      @user.destroy #remove User info from database
      session.clear
      erb :"/users/delete_successful"
    end

end
