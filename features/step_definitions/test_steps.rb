Then(/^coordinate "([^"]*)" should be cruiser$/) do |arg1|
  #expect coordinate "A1" (arg1) to be type cruiser on board of player 1
  game = ObjectSpace.each_object(Game).to_a.first
  p game
  # @@game = Game.new Player, Board
  # @@game.player_1.place_ship Ship.cruiser, :A1, :horizontally
  # @@game.player_1.board[arg1].content.type.to_s
end
