Feature: Place a ship
  As a player
  I want to be able to place a ship on a board
  So that my enemy has something to fire at

  Scenario: User places a ship within board (horizontal)
    Given I am on place ship page
    And I fill in "coordinate" with "A1"
    When I press "place ship"
    Then I should see "CCC"

  Scenario: User places a ship within board (vertical)
    Given I am on place ship page
    And I fill in "coordinate" with "A1"
    And I fill in "orientation" with "vertical" 
    When I press "place ship"
    Then I should see "CCC"
