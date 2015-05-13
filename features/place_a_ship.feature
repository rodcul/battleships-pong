Feature: Place a ship
  As a player
  I want to be able to place a ship on a board
  So that my enemy has something to fire at

  Scenario: User places a ship within board (horizontal)
    Given I am on the Game page
    And I fill in "coordinate" with "A1"
    When I press "Place ship"
    Then I should see "CCC"