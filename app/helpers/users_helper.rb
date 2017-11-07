module UsersHelper
  def user_has_avatar?
    current_user.avatar.picture? 
  end 

end
