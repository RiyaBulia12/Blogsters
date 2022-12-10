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
end
