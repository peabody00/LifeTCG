class PostController < ApplicationController
  get '/post/post' do
    @post = Post.all
    erb :"/post/post"
  end

  get '/post/new' do
    @post = Post.new
    erb :"/post/new"
  end
  
  post '/post/post' do
    @post = Post.create(params)
    erb :"/post/post"
  end

  get '/post/:id' do
    @post = Post.find(params[:id])
    erb :"/post/show"
  end

  # get '/post/:id/edit' do
  #   @post = Post.find(params[:id])
  #   erb :"/post/edit"
  # end

  # patch "/post/:id" do
  #   @article = Article.find(params[:id])
  #   @article.update(params[:article])
  #   redirect to "/post/#{@article.id}"
  # end

  # delete "/post/:id" do
  #   Article.destroy(params[:id])
  #   redirect to "/post"
  # end


end