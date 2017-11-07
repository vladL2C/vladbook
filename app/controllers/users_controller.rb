class UsersController < ApplicationController
  before_action :correct_user, except: [:public_profile, :find_user]

  def profile
    if current_user.avatar.nil?
      @avatar = current_user.build_avatar
    else   
      @avatar = current_user.avatar
    end 
  end

  def public_profile

  end

  def friends

  end

  def sent_requests

  end  
  
  def received_requests

  end  

  def find_user
    if params[:name]
      @users = User.where(name: params[:name])
      if @users.empty?
        flash[:warning] = "No user"
        redirect_to search_path
      end
    end      
  end 

  private 
  def correct_user
    redirect_to(root_path) unless current_user.id == params[:id].to_i
  end
  
end
