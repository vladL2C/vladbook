module LikesHelper

	def liked_post?(post,user)
		post.likes.pluck(:user_id).include?(user.id)
	end 

	def liked_comment?(comment,user)
		comment.likes.pluck(:user_id).include?(user.id)
	end 
end
