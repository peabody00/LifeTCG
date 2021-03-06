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
    @all_users = User.all.order(life_value: :desc)
    erb :index
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def life_value
      @life = UserCard.all.select {|m| m.user_id == session[:user_id]}
      life_array = []
      @life.each do |m|
        life_array << m.card.value
      end
      @user = User.find_by(id: session[:user_id])
      @user.life_value = life_array.sum
      @user.save
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
      UserCard.create(:user_id => session[:user_id], :card_id => @card.id)
    end

  end

end
