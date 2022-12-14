class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:author)
  end

  def new
    @user = User.new
  end
end
