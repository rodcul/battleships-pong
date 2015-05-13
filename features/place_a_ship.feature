Feature: Place a ship
  As a player
  I want to be able to place a ship on a board
  So that my enemy has something to fire at

  Scenario: User places a ship within board (horizontal)
    Given I am on place ship page
    And I fill in "coordinate" with "A1"
    And I check "horizontally" within "orientation"
    When I press "place ship"
    Then I should see "CCC"

  @ignore
  Scenario: User places a ship within board (vertical)
    Given I am on place ship page
    And I fill in "coordinate" with "E4"
    And I check "vertically" within "orientation"
    When I press "place ship"
    Then coordinate "E4" should be cruiser
    And coordinate "E5" should be cruiser
    And coordinate "E6" should be cruiser

  @ignore
  Scenario: User places a ship on top of another
    Given I am on place ship page
    And I fill in "coordinate" with "E4"
    And I check "vertically" within "orientation"
    When I press "place ship"
    Then I should see "Error: ship overlay or outside board"
