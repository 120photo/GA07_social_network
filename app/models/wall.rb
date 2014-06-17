class Wall
	include Mongoid::Document

	has_many :posts
	belongs_to :user
end