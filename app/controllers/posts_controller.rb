class PostsController < ApplicationController
  def create
    @post = current_user.posts.new(post_params)
      if @post.save
        flash[:success] = "post created"
        redirect_to public_profile_path(current_user)
      end     
  end 

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end 
end
