class PostingController < ApplicationController
	# unutilized
	def new
	end

	# save new post 
	def create
		posting = Posting.new

		posting.profile = params[:id]
		posting.status_update = params[:posting][:status_update]
		posting.user = @current_user

		profile = Profile.find(params[:id])
		@user = profile.user_id
		user_profile = Profile.find_by(user_id: @current_user)
		posting.user_name = user_profile.user_name
		posting.save!

		redirect_to "/profile/#{@user}"
	end
end