Feature: Delete a post
	In order to remove a group
	As Fred
	I want to delete a group from the list of posts

	What we know:
	- each group has a list of groups
	- users can only delete their own groups
	
	Open questions:
	- why is the sky blue?

	Scenario:
		Given a user is logged in
  	When the following groups are available:
      | group name      |
      | Pandas          |
    When I am on the list of groups page
		And I press "Delete"
		Then I should not see "Pandas"

	Scenario:
		Given a user is logged in
    When the following posts created at the following times exist in the "master_group":
      | post content |
      | Hey cohorts  |
    When I am on the list of groups page
		And I press "Delete"
		Then I should see "Confirm Deletion"
