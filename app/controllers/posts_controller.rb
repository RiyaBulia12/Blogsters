class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:author, :comments).where(author: @user)
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'Post was successfully deleted!'
    redirect_back(fallback_location: root_path)
  end
end
