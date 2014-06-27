class Posting
	include Mongoid::Document

	# save posts


	belongs_to :profile
	belongs_to :user


	field :status_update, type: String
	field :user_name, type: String
end