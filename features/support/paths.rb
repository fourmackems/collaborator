# Taken from the cucumber-rails project.

module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    when /the new message page/
      '/groups/master_group'

    when /list of groups page/
      '/groups'

    when /the my groups page/
      '/my_groups'

    when /the timeline page/
      '/groups/testgroup'

    when /add a new group page/
      '/group/create'

    when /the master_group timeline page/
      '/groups/master_group'
    when /the sign up page/
      '/sign_up'

    when /the create users page/
      '/users/create'

    when /the goodbye page/
      '/goodbye'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
