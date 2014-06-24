class ProfileController < ApplicationController
	def new
	end

	def show
		@current_user_profile = User.find(params[:id])
		@email = @current_user_profile.email
		@user_id = @current_user_profile.id
	    @current_profile = Profile.where(user_id: params[:id])
	    # @current_profile = Profile.find(user_id: params[:@user_id])
	    # @user = @current_profile.user_name
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