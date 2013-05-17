Given(/^the following groups are available:$/) do  |group_names|
	#[{'group_name' => 'Monkey'}, {'group_name' => 'Tiger'}]

	group_names.hashes.each do |group_name|
  	Group.create(:group_name => group_name['group name'], :url => group_name['group name'].gsub(' ', '_'))
  end
end

Then(/^I will see the following groups:$/) do |group_names|

	group_names.hashes.each do |group_name|
  	page.should have_content(group_name['group name'])
	end
end

#	<% groups.each do |groups| %>
#	  <li><%= groups.group_name %></li>
When(/^I select "Hiking" from  within "groups":$/) do
  redirect '/groups/hiking'
end


When(/^the my groups page$/) do
  page.should have_content 'My groups'
end