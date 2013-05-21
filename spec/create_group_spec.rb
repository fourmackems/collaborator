require 'collaborator'
require 'rspec'
require 'rack/test' # rack is a specification close to the TCP/IP protocol. rack test is a set of testing helpers allowing test of web applications

describe 'create_group' do
  include Rack::Test::Methods  # importing methods to test as if was a web applciation. see the sinatra documentation for info on rack tests.

  def app
    Collaborator
  end

  it 'creates a new group' do
  	user = double User
  	User.should_receive(:find).and_return(user)

    Group.should_receive(:create).with({:group_name => 'testgroup', :url => 'testgroup'})
    post '/groups', {'add_group' => 'testgroup'}
  end
end

# +=+=+=+ Tap up Nicky or Matt regards the above tests +=+=+=+ #