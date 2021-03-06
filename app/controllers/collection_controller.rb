class CollectionController < ApplicationController
  get '/collection' do
    if logged_in?
      @collection = UserCard.all.select {|m| m.user_id == session[:user_id]}
      @user = User.find_by(id: session[:user_id])
      start = Time.parse(@user.pack_start)
      stop = Time.parse(@user.pack_end)
      @elapsed = stop - start
      erb :'/collection/collection'
    else
      redirect to '/login'
    end
  end

  post '/collection' do
    if logged_in?
      @cardpack = []      
      3.times do
        card_pack
        @cardpack << @card
      end
      life_value
      @user = User.find_by(id: session[:user_id])
      @user.pack_start = Time.now
      @user.save
      
      erb :'/collection/cardpack'
    else
      redirect to '/login'
    end
  end
end