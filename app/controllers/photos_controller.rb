class PhotosController < ApplicationController

	def create
		return redirect_to profile_path(current_user) if params[:photo].blank?
		@avatar = current_user.build_avatar(avatar_params)
		if @avatar.save
			redirect_to profile_path(current_user)	
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
	def avatar_params
		params.require(:photo).permit(:picture)
	end 
end
