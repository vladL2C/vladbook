class FriendshipsController < ApplicationController
	before_action :get_friendship, only: [:accept]

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
  	@friendship.update_attribute(:accepted, true)
  	redirect_back(fallback_location: profile_path(current_user))
  end 

  private

  def get_friendship
  	@friendship = Friendship.find_by(requested_id: params[:requested_id], request_id: params[:request_id])
  end 

end
