Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Go to Game
    Given I am on the homepage
    When I follow "Player 1"
    Then I should see "Place your ship"
    And I should see "ABCDEFGHIJ"
