class CollectionController < ApplicationController
  get '/collection' do
    if logged_in?
      @collection = UserCard.all.select {|m| m.user_id == session[:user_id]}
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
      erb :'/collection/cardpack'
    else
      redirect to '/login'
    end
  end
end