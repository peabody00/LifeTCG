require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    @random = Card.all.sample
    # life_value
    erb :index
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      # User.find(session[:user_id])
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def life_value
      @users = UserCard.all.select {|m| m.user_id == session[:user_id]}
      life_array = []
      @users.each do |m|
        life_array << m.card.value
      end
      # life_array.sum = @current_user.life_value
    end

    def card_pack
      random_number = rand(1..100)
      if random_number <= 55
        @card = Card.where("rarity = 'Common'").sample
      elsif random_number >= 56 && random_number <= 80
        @card = Card.where("rarity = 'Uncommon'").sample
      elsif random_number >= 81 && random_number <= 90
        @card = Card.where("rarity = 'Rare'").sample
      elsif random_number >= 91 && random_number <= 98
        @card = Card.where("rarity = 'Epic'").sample
      else
        @card = Card.where("rarity = 'Legendary'").sample
      end
    end

  end

end
