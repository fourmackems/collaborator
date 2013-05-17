class Group
	include Mongoid::Document
	field :group_name, type: String
	field :url, type: String

	has_many :posts

  has_and_belongs_to_many :users

# this might not be right- what is the right syntax for the above?
end