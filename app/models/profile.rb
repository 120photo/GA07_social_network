class Profile
	Mongoid::Document

	field :user_name, type: String # this should be a users real name, not a uniq login name
	field :bio, type: String # short profile description
end