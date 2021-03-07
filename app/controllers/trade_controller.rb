class TradeController < ApplicationController
    get '/trade' do
        if logged_in?
            @trades = Trade.all
            erb :'trade/trade'
        else
            redirect to '/login'
        end
    end

    post '/trade' do
        if logged_in?
  
          else
            redirect to '/login'
          end
    end
end