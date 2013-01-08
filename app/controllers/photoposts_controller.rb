class PhotopostsController < ApplicationController
	before_filter :logged_in_user

	def create
		@photopost = current_user.photoposts.build(params[:photopost])
		if @photopost.save
			flash[:success] = "Photo uploaded successfully!"
			redirect_to root_path
		else
			render 'static_pages/home'
		end
	end

	def destroy

	end

end