class CommentsController < ApplicationController
  def	new
    @comment = Comment.new 
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id 
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
