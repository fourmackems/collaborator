Feature: A user can 'like' a group, which displays the group on their 'My Groups' page
  In order for Bob to see the groups he likes
  I want to be able to like any group
  Then the group will appear in the 'My Groups' page


  What we know:


  Open Questions:

  Scenario: Liking a group
    Given a user is logged in
    When the following groups are available:
    | group name |
    | A Group |
    When I am on the list of groups page
    Then I will see the following groups:
    | group name |
    | A Group |
    And I follow "Like?"
    Then I should see 'Unlike'

  Scenario: Like a group associates a group to a user
    Given a user is logged in
    When the following groups are available:
    | group name |
    | A Group |
    When I am on the list of groups page
    Then I will see the following groups:
    | group name |
    | A Group |
    And I follow "Like?"
    When I am on the my groups page
    Then I will see the following groups:
    | group name |
    | A Group |
