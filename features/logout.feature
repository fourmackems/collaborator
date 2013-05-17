Feature: log a user out of the application when logout button is selected
  In order to logout
  As Bob
  I want to press logout button
  Then the session will end
  And Bob will be redirected to goodye page
  And Bob will not be able to access his groups without logging back in

  What we know:
    Bob is currently logged in
    His session is active

  Open Questions:
    Is the logout button only available on non-homepage pages?

  Scenario: Logout
    Given a user is logged in
    When I am on the list of groups page
    And I follow "Logout"
    Then I should see the goodbye page
    And I cannot access the list of groups
    And I cannot see the Logout button
    And I cannot see the Groups button


  #Scenario: Logout button does not exist on the homepage or goodbye page