module FriendshipsHelper

	def not_accepted?(other_user)
		!Friendship.find_by(requested_id: current_user.id, request_id: other_user.id).accepted?
	end 
end
