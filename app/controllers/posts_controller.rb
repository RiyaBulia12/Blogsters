class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :text))
    post.author = current_user

    if post.save
      redirect_to "/users/#{post.author.id}/posts"
    else
      flash.now[:errors] = post.errors.full_messages
      render :new
    end
  end
end
