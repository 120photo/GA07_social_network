class Post
	include Mongoid::Document

	belongs_to :user
	belongs_to :wall

	field :post, type: String
end