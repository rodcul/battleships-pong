require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  @@game = Game.new Player, Board
  set :views, Proc.new { File.join(root, "..", "views") }

  get '/' do
    erb :index
  end

  get '/game/new' do
    @error = params[:error]

    if @error.nil?
      @message = "What's your name?"
    else
      @message = "Please put in a valid name"
    end
    erb :game_new
  end

  post '/game' do
    @board = @@game.own_board_view @@game.player_1
    @name = params[:name]
    @coordinate = params[:coordinate]
    @@game.player_1.place_ship Ship.battleship, @coordinate, :vertically

    if @name.empty?
      redirect '/game/new?error=name'
    else
      erb :game
    end
    # erb :place_ship
  end

  get '/game/ship' do
    erb :place_ship
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
