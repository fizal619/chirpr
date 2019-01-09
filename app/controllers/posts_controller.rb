class PostsController < ApplicationController

  before_action :require_login, except: [:index]


  def index
    @posts = Post.all.reverse
    @new_post = Post.new
  end

  def create
    @temp = Post.create({
      body: params[:post][:body],
      user_id: current_user.id
    })
    if @temp.valid?
      flash[:notice] = "POST CREATED!"
    else
      flash[:notice] = "YOU TYPED TOO MUCH!"
    end
    redirect_to '/'
  end

  # this action shows the form
  def edit
    @post = Post.find(params[:id])
    if current_user.id != @post.user.id
      redirect_to '/'
    end
  end

  #this action handles the form
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    @post.save
  end

  # /post/:id
  def destroy
    @post = Post.find(params[:id])
    if current_user.id == @post.user.id
      @post.destroy
    end
    redirect_to '/'
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id)
  end

end
