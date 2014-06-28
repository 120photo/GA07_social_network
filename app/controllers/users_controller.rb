class UsersController < ApplicationController
	
	# directs to new user form
	def new
	end

	# saves new user
	def create
		user = User.new # create a new instance of User class
		# code below grabs params from the browser and uses info to create data in User record
		
		# user.user_name = params[:user][:user_name]
		user.email = params[:user][:email]
		# user.bio = params[:user][:bio]
		user.password = params[:user][:password]
		user.password_confirmation = params[:user][:password_confirmation]
		user.save!
		session[:user_id] = user.id.to_s
		# converts newly created document
		# bson id to string and saves in session
		# so session is associated to user
		redirect_to '/create_profile'
	end

	# adds news friend to arry in user
	def add_friend
		# unless @current_user.friends.include? params[:id] 
		@current_user.push(friends: params[:id])
		# push to friends array id number of friend

		redirect_to "/profile/#{@current_user.id}"
		# show the new friend
	end
end