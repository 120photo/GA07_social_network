class Wall
	include Mongoid::Document

	# wall belongs to one user but can have
	# multiple post
	
	has_many :posts
	belongs_to :user
end