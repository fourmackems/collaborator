class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, type: String
  belongs_to :group
end

