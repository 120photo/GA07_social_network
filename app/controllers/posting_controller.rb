class PostingController < ApplicationController
	def new
	end

	def create
		posting = Posting.new

		posting.profile = params[:id]
		posting.status_update = params[:posting][:status_update]
		posting.user = @current_user

		user_profile = Profile.find_by(user_id: @current_user)
		posting.user_name = user_profile.user_name
		posting.save!

		redirect_to "/"
	end
end