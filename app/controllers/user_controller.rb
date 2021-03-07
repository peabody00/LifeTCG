class UserController < ApplicationController
    get '/users/:slug' do
      @user = User.find_by_slug(params[:slug])
      erb :'users/profile'
    end
  
    get '/signup' do
      if !logged_in?
        erb :'users/signup'
      else
        redirect to '/users/profile'
      end
    end

    get '/error' do
      erb :'users/error'
    end
  
    post '/signup' do
      if params[:username] == "" || params[:password] == ""
        redirect to '/signup'
      elsif
        User.exists?(:username => params[:username])
        redirect to '/error'
      else
        @user = User.new(:username => params[:username], :password => params[:password])
        @user.save
        session[:user_id] = @user.id
        redirect to '/users/profile'
      end
    end
  
    get '/login' do
      if !logged_in?
        erb :'users/login'
      else
        redirect to '/users/profile'
      end
    end
  
    post '/login' do
      user = User.find_by(:username => params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect to "/users/profile"
        life_value
      else
        redirect to '/signup'
      end
    end
  
    get '/logout' do
      if logged_in?
        @user = User.find_by(id: session[:user_id])
        @user.pack_end = Time.now
        @user.save
        session.destroy
        redirect to '/'
      else
        redirect to '/'
      end
    end
end