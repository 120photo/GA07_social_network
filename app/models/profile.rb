class Profile
	include Mongoid::Document
	include Mongoid::Paperclip

	belongs_to :user
	has_many :postings

	# for image upload
	has_mongoid_attached_file :image
	validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]


	field :user_name, type: String # this should be a users real name, not a uniq login name
	field :bio, type: String # short profile description

end