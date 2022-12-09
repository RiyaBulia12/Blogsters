class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_post_url(@post.user_id, @post.id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end


end
