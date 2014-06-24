class ProfileController < ApplicationController
	def index
	end

	def show
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