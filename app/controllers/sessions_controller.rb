class SessionsController < ApplicationController
	# directs to login page
	def new
	end

	# saves to session/validates/logs in
	def create
		# method interacts with session > new.html.erb view
		user = User.where(email: params[:user_email]).first
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id.to_s
			redirect_to '/'
		else
			redirect_to :back
		end
	end

	# logout
	def destroy
		session[:user_id] = nil
		flash[:notice] = "Logged out!"
		redirect_to '/'
	end
end