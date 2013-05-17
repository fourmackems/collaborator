class User
	include Mongoid::Document
	field :username, type: String
	field :password, type: String

  has_and_belongs_to_many :groups

# this might not be right- what is the right syntax for the above?

end
