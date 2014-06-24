class User
	include Mongoid::Document # creates mongoDB connection with this model / class
	include ActiveModel::SecurePassword # needed for password authentication

	# field :user_name, type: String # this should be a users real name, not a uniq login name
	field :email, type: String # email will be used for loggin in
	# field :bio, type: String # short profile description
	field :password_digest, type: String # password

	validates :email, presence: true, uniqueness: true

	has_secure_password

	has_one :profile
end