class ProfileController < ApplicationController
	# directs to new user form
	def new
	end

	# shows all profile, friend, posting info
	def show
		# find current user profile
		@current_profile = Profile.find_by(user_id: params[:id])
		# find current user and set instance variables
		# for user info (email and id)
		@current_user_profile = User.find(params[:id])
		@email = @current_user_profile.email
		@user_id = @current_user_profile.id

		# get all wall posts on current profile
		@all_wall_posts = Posting.where(profile_id: @current_profile.id)

		# get all friends of user
		friends = @current_user_profile.friends.to_a.uniq
		
		# gets user names of friends
		@friends = []
		friends.each do |x|
			@friends << Profile.find_by(user_id: x).user_name
		end
	end

	# unutilized method
	def profiles
		# method gets all profiles
		# finds user id, user email, and all other profiles
		@member = User.find(params[:id])
		@email = @member.email
		@member_profile = Profile.all
		@member_profile = @member_profile.where(user_id: params[:id])
	end

	# saves profile
	def create
		# method creates profile and saves
		profile = Profile.new
		profile.user_name = params[:profile][:user_name]
		profile.bio = params[:profile][:bio]
		profile.image = params[:profile][:image]
		profile.user =  @current_user
		# sets user id mongoid magic
		profile.save!
		redirect_to '/'
	end

	# edits profile with prefilled current info
	def edit_profile
		# prepopulates form with current profile info
		profile = Profile.find_by(user_id: params[:id])
		@alias = profile.user_name
		@bio = profile.bio
	end

	# gets all profiles
	def all
		@all = Profile.all
	end

	# saves changes to profile
	def save_changes
		# saves changes to bio/image/user_name
		profile = Profile.find_by(user_id: params[:id])
		profile.bio = params[:profile][:bio]
		profile.user_name = params[:profile][:user_name]
		profile.image = params[:profile][:image]
		profile.save!
		redirect_to "/profile/#{@current_user.id}"
		# goes back to profile 
	end
end