class Post
	include Mongoid::Document

	# post belong both to a user who posted them
	# and to a users wall

	belongs_to :user
	belongs_to :wall

	field :post, type: String
end