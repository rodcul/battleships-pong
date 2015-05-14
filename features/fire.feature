Feature: Fire at a board
  As player 1
  I want to be able to fire at my own board
  So that I can simulate a game of solo battleships

  Scenario: Go to the fire page
  Given I am on "Player 1"
    Given I am on place ship page
    When I follow "Shoot ships"
    Then I should see "Enter a coordinate to fire at"

  Scenario: Fire a shot that misses
  Given I am on "Player 1"
    Given I am on the fire page
    And I fill in "coordinate" with "A4"
    When I press "Fire!"
    Then I should see "-"

  Scenario: Error: Fire when it's not your turn
    Given I am on "Player 1"
    And I go to the fire page
    And I fill in "coordinate" with "A4"
    When I press "Fire!"
    Then I should see "Error: wait your turn"
