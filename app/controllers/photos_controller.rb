class PhotosController < ApplicationController

	def create
		@avatar = current_user.build_avatar(avatar_params)
		if @avatar.save
			redirect_to profile_path(current_user)
		end 
	end 

	private
	def avatar_params
		params.require(:photo).permit(:picture)
	end 
end
