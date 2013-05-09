require 'collaborator'
require 'rspec'
require 'rack/test'


describe Collaborator do
	include Rack::Test::Methods

	def app
		Collaborator # creates a new instance of Collaborator and makes it available to the tests
	end

	it 'returns all the groups in the database' do
		Group.should_receive(:all)

		get '/list-of-groups'
	end

it 'sending a request to /' do
    get '/'
    
    last_response.body.should eq 'Hey there'
end

it 'post a new message' do
    Post.should_receive(:create).with(content: 'Hello Collaborators!')
    post '/mock-groupname', {"message"=>"Hello Collaborators!"}
end

it 'posts new message to a group' do 
	  Post.should_receive(:create).with(content: 'Hello Collaborators!')
    post.should_receive(:group_name)
end
 # tells it to only return the group name on the page we are interested in (list of groups)
	
	#context 'creating a new post' do
	#	it 'saves a new post' do
	#		Group.should_receive(:create).with(message: 'Hey test')
	#		post '/mock-groupname', { :message => 'Hey test' }
	#	end
	#end

end