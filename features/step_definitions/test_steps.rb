Then(/^coordinate "([^"]*)" should be cruiser$/) do |arg1|
  #expect coordinate "A1" (arg1) to be type cruiser on board of player 1
  game = ObjectSpace.each_object(Game).to_a.first
  expect(game.player_1.board[arg1.to_sym].content.type.to_sym).to eq :cruiser
end


Given(/^I choose radio button "([^"]*)"$/) do |orientation|
  page.choose(orientation)
end
