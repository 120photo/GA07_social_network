class ProfileController < ApplicationController
	def new
	end

	def show

		@current_profile = Profile.find_by(user_id: params[:id])
		
		@current_user_profile = User.find(params[:id])
		@email = @current_user_profile.email
		@user_id = @current_user_profile.id

		@all_wall_posts = Posting.where(profile_id: @current_profile.id)

		@friends = @current_user_profile.friends

	    # @current_profile = Profile.find(user_id: params[:@user_id])
	    # @user = @current_profile.user_name
		# @profile = Profile.all # pulls all user profiles

		#gets profile
	end

	def profiles
		@member = User.find(params[:id])
		@email = @member.email
		@mewmber_profile = Profile.all
		@member_profile = @member_profile.where(user_id: params[:id])
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

	def edit_profile
		profile = Profile.find_by(user_id: params[:id])
		@alias = profile.user_name
		@bio = profile.bio
		@image = profile.image
	end

	def save_changes
		profile = Profile.find_by(user_id: params[:id])
		profile.bio = params[:profile][:bio]
		profile.user_name = params[:profile][:user_name]
		# profile.image = params[:profile][:image]
		if params[:profile][:image] == nil
			profile.image = profile.image
		else
			profile.image = params[:profile][:image]
		end
		profile.save!
		redirect_to "/profile/#{@current_user.id}"

	end
end