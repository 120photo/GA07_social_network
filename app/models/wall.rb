class Wall
	# using an instance variable to 
	# store all of wall from posting
	# database on profile controller

	include Mongoid::Document

	# wall belongs to one user but can have
	# multiple post
	
	has_many :postings
	belongs_to :user
end