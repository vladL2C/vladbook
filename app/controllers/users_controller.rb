class UsersController < ApplicationController
  before_action :correct_user, only: :profile

  def profile
    if current_user.avatar.nil?
      @avatar = current_user.build_avatar
    else   
      @avatar = current_user.avatar
    end 
  end

  def update
    return redirect_to profile_path(current_user) if params[:photo].blank?
    @avatar = current_user.avatar 
    if @avatar.update_attributes(avatar_params)
      redirect_to profile_path(current_user)
    end
  end 
  
  private 
  def correct_user
    redirect_to(root_path) unless current_user.id == params[:id].to_i
  end
  
end
