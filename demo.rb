require 'battleships'

game = Game.new Player, Board
game.player_1.place_ship Ship.battleship, :B4, :vertically
game.player_2.place_ship Ship.cruiser, :G6
game.player_1.shoot :C2
game.player_2.shoot :B4
puts game.own_board_view game.player_1
game.has_winner?
