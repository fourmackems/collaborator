Then(/^I should see the goodbye page$/) do
  page.should have_content 'Thanks for Watching!'
end

And(/^I cannot access the list of groups$/) do
  visit '/groups'
  page.should_not have_content 'Your groups'
end

And(/^I cannot see the Logout button$/) do
  visit '/'
  page.should_not have_content 'Logout'
end