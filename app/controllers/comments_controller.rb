class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to feed_path
    else 
      render 'static_pages/feed'
    end   
  end 

  def destroy
    @comment = Comment.find(params[:id])
    if current_user == @comment.user
      @comment.delete
      flash[:success] = "Comment Deleted"
      redirect_to feed_path
    else 
      flash[:success] = "Thats a no from me"
      redirect_to feed_path 
    end    
  end 

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end 
end
