Feature: List all groups
  In order to see the groups to which i am a member
  As Bob
  I want to see my groups

  What we know:
  =============
  - A person can belong to any number of groups
  - Groups are visible
  - Needs a title


  Open Questions:
  ===============
  - Do we show groups graphically or with text?
  - Do we show any information about the group other than title?

  Scenario: Showing all the groups any given user belongs to
    Given a user is logged in
    When the following groups are available:
    | group name |
    | Hiking |
    | Monkey |
    | Tiger |
    When I am on the list of groups page
    Then I will see the following groups:
    | group name |
    | Hiking |
    | Monkey |
    | Tiger |
    When I follow "Hiking"
    Then I should see "You are in the group named: Hiking"

