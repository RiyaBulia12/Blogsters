class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.author = current_user
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to "/users/#{current_user.id}/posts/#{params[:post_id]}"
    else
      render :create
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])

    @comment.destroy

    flash[:success] = "Comment was successfully deleted."
    redirect_back(fallback_location: root_path)
  end
end
