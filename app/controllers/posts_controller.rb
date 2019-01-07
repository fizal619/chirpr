class PostsController < ApplicationController
  def index
    @posts = Post.all.reverse
    @new_post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to '/'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    @post.save
  end

  # /post/:id
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/'
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id)
  end

end
