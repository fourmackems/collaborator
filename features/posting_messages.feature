
Feature: Post a new message
  In order to comunicate with my mates
  As Fred
  I want to post a message

  What we know:
  =============
  - A person can post a message
  - Message is visible
  - Needs a button and a text field
  - Limit of 300 characters


  Open Questions:
  ===============
  - Spell checker?
  - Does a message need to be part of a group?
  - What about multimedia? (photos, videos, etc)

  @javascript
  Scenario: Posting a new message
    Given a user is logged in
    When the following posts created at the following times exist in the "master_group":
      | post content |
      | Hey cohorts  |
      | What's up?   |
    When I am on the master_group timeline page
    And I fill in "message" with "Hey Collaborators!"
    And I submit by pressing "post-button"
    Then I should see "Hey Collaborators!"
    
  Scenario: Posting a new message when group name is more than one word
    Given a user is logged in
    When the following groups are available:
      | group name |
      | Hiking friends|
    When I am on the list of groups page
    And I follow "Hiking friends" 
    And I fill in "message" with "Hey hikers!"
    And I press "Post"
    Then I should see "Hey hikers!"
