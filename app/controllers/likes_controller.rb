class LikesController < ApplicationController
  
  def create
  	if @like = current_user.likes.new(user_id: params[:current_user], 
  																 likable_id: params[:likable_id], 
  																 likable_type: params[:likable_type])
  	  @like.save
  		redirect_to feed_path
  	 else @like = current_user.likes.new(user_id: params[:current_user], 
  																 likable_id: params[:likable_id], 
  																 likable_type: params[:likable_type])
  		@like.save
  		redirect_to feed_path	
  	end   
  end 

  def destroy
  	@like = Like.find(params[:id])
  	@like.destroy
  	redirect_to feed_path
  end
   
end
