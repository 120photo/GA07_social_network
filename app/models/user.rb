class User
	include Mongoid::Document
	include ActiveModel::SecurePassword

	field :name,			type: String
	field :email,			type: String
	field :bio,				type: String
	field :password_digest,	type: String

	# validates :email, presence: true, uniqueness: true

	has_secre_password
end