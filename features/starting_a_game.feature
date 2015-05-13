Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Go to Game
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "What's your name?"

  Scenario: Register your name
    Given I am on the New Game page
    When I fill in "name" with "Rodney"
    And I press "send name"
    Then I am on the Game page
    Then I should see "Rodney"
