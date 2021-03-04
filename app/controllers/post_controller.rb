class PostController < ApplicationController
  get '/post' do
    if logged_in?
      @post = Post.all
      erb :'/post/post'
    else
      redirect to '/login'
    end
  end

  get '/post/new' do
    if logged_in?
      erb :'post/new'
    else
      redirect to '/login'
    end
  end

  post '/post' do
    if logged_in?
      if params[:text] == ""
        redirect to "/post/new"
      else
        @post = current_user.posts.build(text: params[:text])
        if @post.save
          redirect to "/post"
        else
          redirect to "/post/new"
        end
      end
    else
      redirect to '/login'
    end
  end

  get '/post/:id' do
    if logged_in?
      @post = Post.find_by_id(params[:id])
      erb :'post/show'
    else
      redirect to '/login'
    end
  end

  get '/post/:id/edit' do
    if logged_in?
      @post = Post.find_by_id(params[:id])
      if @post && @post.user == current_user
        erb :'post/edit'
      else
        redirect to '/post'
      end
    else
      redirect to '/login'
    end
  end

  patch '/post/:id' do
    if logged_in?
      if params[:content] == ""
        redirect to "/post/#{params[:id]}/edit"
      else
        @post = Post.find_by_id(params[:id])
        if @post && @post.user == current_user
          if @post.update(text: params[:text])
            redirect to "/post/#{@post.id}"
          else
            redirect to "/post/#{@post.id}/edit"
          end
        else
          redirect to '/post'
        end
      end
    else
      redirect to '/login'
    end
  end

  delete '/post/:id/delete' do
    if logged_in?
      @post = Post.find_by_id(params[:id])
      if @post && @post.user == current_user
        @post.delete
      end
      redirect to '/post'
    else
      redirect to '/login'
    end
  end
end