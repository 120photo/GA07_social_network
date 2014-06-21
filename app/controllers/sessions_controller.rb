class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.where(user_name: params[:user_name]).first
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id.to_s
			redirect_to '/'
		else
			redirect_to '/'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "Logged out!"
		redirect_to '/'
	end
end