module LikesHelper

	def liked_post?(post,user)
		post.likes.pluck(:user_id).include?(user.id)
	end 

	def liked_comment?(comment,user)
		comment.likes.pluck(:user_id).include?(user.id)
	end

  def get_post_like_id(user,post)
    Like.where(user_id: user.id, likable_id: post.id).first.id
  end 

  def get_comment_like_id(user,comment)
    Like.where(user_id: user.id, likable_id: comment.id).first.id
  end 
end
