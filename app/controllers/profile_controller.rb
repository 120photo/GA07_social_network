class ProfileController < ApplicationController
	def new
	end

	def show
		@current_profile = Profile.find(params[:id])
		#gets profile
	end

	def create
		profile = Profile.new

		profile.user_name = params[:profile][:user_name]
		profile.bio = params[:profile][:bio]
		profile.image = params[:profile][:image]
		profile.save!
		redirect_to '/'
	end
end