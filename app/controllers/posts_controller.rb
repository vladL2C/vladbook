class PostsController < ApplicationController
  def create
    @post = current_user.posts.new(post_params)
      if @post.save
        redirect_to feed_path
      end     
  end 

  def destroy
    @post = Post.find(params[:id])
    if current_user == @post.user 
      @post.destroy
      flash[:success] = "Post Deleted"
      redirect_to feed_path
    else
      flash[:error] = "dude you cant delete other peoples posts"
      redirect_to feed_path
    end  
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  

end 
