class ProfileController < ApplicationController
	def new
	end

	def show
		@current_user_profile = User.find(params[:id])
	    @current_profile = Profile.where(user_id: params[:id])
		# @profile = Profile.all # pulls all user profiles

		#gets profile
	end

	def all
		@all = Profile.all
	end

	def create
		profile = Profile.new

		profile.user_name = params[:profile][:user_name]
		profile.bio = params[:profile][:bio]
		profile.image = params[:profile][:image]
		profile.user =  @current_user
		profile.save!
		redirect_to '/'
	end
end