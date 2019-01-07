class PostsController < ApplicationController
  def index
    @posts = Post.all.reverse
  end

  def create
    Post.create(body: params[:body], user_id: params[:user_id])
    redirect_to '/'
  end

  def edit
  end

  def update
  end

  # /post/:id
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/'
  end
end
