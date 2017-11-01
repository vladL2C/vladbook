class UsersController < ApplicationController
  before_action :correct_user, only: :profile

  def profile
  end

  private 
  def correct_user
    redirect_to(root_path) unless current_user.id == params[:id].to_i
  end  
end
