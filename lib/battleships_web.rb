require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  @@game = Game.new Player, Board
  set :views, Proc.new { File.join(root, "..", "views") }

  get '/' do
    erb :index
  end

  get '/game/new' do
    erb :game_new
  end

  post '/game' do

    @board = @@game.own_board_view @@game.player_1
    @name = params[:name]
    erb :game
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
