Feature: Delete a group
	In order to remove a group
	as Fred
	I want to delete my own group from the list of group

	What we know:
	- there are groups
	- users can delete groups

	Scenario:
		Given a user is logged in
		Given the following posts created at the following times exist in the "/groups":
		|penguins|
		|parrots |
		When I am on the list of groups page
		And I press "Delete"
		Then I should see "parrots"
