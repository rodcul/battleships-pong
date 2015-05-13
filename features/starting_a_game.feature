Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Go to Game
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "What's your name?"

  Scenario: Register your name & create new game
    Given I am on the New Game page
    And I fill in "name" with "Alex"
    When I press "send name"
    Then I should be on the Game page
    And I should see "Alex"
    And I should see "ABCDEFGHIJ"

  Scenario: User does not provide their name
    Given I am on the New Game page
    And I fill in "name" with ""
    When I press "send name"
    Then I should be on the New Game page
    And I should see "Please put in a valid name"

Feature: Place a ship
  As a player
  I want to be able to place a ship on a board
  So that my enemy has something to fire at

  Scenario: User places a ship within board (horizontal)
    Given I am on the Game page
    And I fill in "coordinate" with "A1"
    When I press "Place ship"
    Then I should see "CCC"
