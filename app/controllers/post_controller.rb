class PostController < ApplicationController
  get '/post/post' do
    if logged_in?
      @post = Post.all
      erb :'/post/post'
    else
      redirect to '/login'
    end
  end

  get '/post/post/new' do
    if logged_in?
      erb :'post/new'
    else
      redirect to '/login'
    end
  end

  post '/post/post' do
    if logged_in?
      if params[:text] == ""
        redirect to "/post/post/new"
      else
        @post = current_user.posts.build(text: params[:text])
        if @post.save
          redirect to "/post/post"
        else
          redirect to "/post/post/new"
        end
      end
    else
      redirect to '/login'
    end
  end

  # get '/tweets/:id' do
  #   if logged_in?
  #     @tweet = Tweet.find_by_id(params[:id])
  #     erb :'tweets/show_tweet'
  #   else
  #     redirect to '/login'
  #   end
  # end

  # get '/tweets/:id/edit' do
  #   if logged_in?
  #     @tweet = Tweet.find_by_id(params[:id])
  #     if @tweet && @tweet.user == current_user
  #       erb :'tweets/edit_tweet'
  #     else
  #       redirect to '/tweets'
  #     end
  #   else
  #     redirect to '/login'
  #   end
  # end

  # patch '/tweets/:id' do
  #   if logged_in?
  #     if params[:content] == ""
  #       redirect to "/tweets/#{params[:id]}/edit"
  #     else
  #       @tweet = Tweet.find_by_id(params[:id])
  #       if @tweet && @tweet.user == current_user
  #         if @tweet.update(content: params[:content])
  #           redirect to "/tweets/#{@tweet.id}"
  #         else
  #           redirect to "/tweets/#{@tweet.id}/edit"
  #         end
  #       else
  #         redirect to '/tweets'
  #       end
  #     end
  #   else
  #     redirect to '/login'
  #   end
  # end

  # delete '/tweets/:id/delete' do
  #   if logged_in?
  #     @tweet = Tweet.find_by_id(params[:id])
  #     if @tweet && @tweet.user == current_user
  #       @tweet.delete
  #     end
  #     redirect to '/tweets'
  #   else
  #     redirect to '/login'
  #   end
  # end
end