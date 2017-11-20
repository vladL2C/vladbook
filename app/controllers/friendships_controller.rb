class FriendshipsController < ApplicationController

	def create
		current_user.add_user(User.find(params[:requested_id]))
		redirect_back(fallback_location: search_path)
	end 

  def destroy
    current_user.cancle_add(User.find(params[:requested_id]))
    redirect_back(fallback_location: search_path)
  end 

  def decline
  	current_user.decline_request(User.find(params[:request_id]))
  	redirect_back(fallback_location: profile_path(current_user))
  end 

  def accept
  end 
end
