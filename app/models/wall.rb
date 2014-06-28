class Wall
	# unutilized model

	include Mongoid::Document

	
	has_many :postings
	belongs_to :user
end