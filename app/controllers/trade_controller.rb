class TradeController < ApplicationController
    get '/trade' do
        if logged_in?
            @trades = Trade.all
            erb :'trade/trade'
        else
            redirect to '/login'
        end
    end

    get '/trade/mytrades' do
        if logged_in?
            @trades = Trade.all.select {|m| m.user_id == session[:user_id] || m.other_user_id == session[:user_id]}
            erb :'trade/mytrades'
        else
            redirect to '/login'
        end
    end

    get '/trade/:id' do
        if logged_in?
          @trades = Trade.find_by_id(params[:id])
          erb :'trade/view'
        else
          redirect to '/login'
        end
      end
end