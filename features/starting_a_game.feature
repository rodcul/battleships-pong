Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Go to Game
    Given I am on the homepage
    When I follow "Player 1"
    Then I should see "What's your name?"

  Scenario: Register your name & create new game
    Given I am on "Player 1"
    And I am on the New Game page
    And I fill in "name" with "Alex"
    When I press "send name"
    Then I should be on the Game page
    And I should see "Alex"
    And I should see "ABCDEFGHIJ"

  Scenario: User does not provide their name
    Given I am on "Player 1"
    Given I am on the New Game page
    And I fill in "name" with ""
    When I press "send name"
    Then I should be on the New Game page
    And I should see "Please put in a valid name"
