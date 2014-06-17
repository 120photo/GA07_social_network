class UsersController < ApplicationController
	def new
	end

	def new_user
		user = User.new # create a new instance of User class
		# code below grabs params from the browser and uses info to create data in User record
		user.user_name = params[:user][:user_name]
		user.email = params[:user][:email]
		user.bio = params[:user][:bio]
		user.password = params[:user][:password]
		user.password_confirmation = params[:user][:password_confirmation]
		user.save!
		session[:user_id] = user.id.to_s
		redirect_to '/'
	end
end