require 'sinatra/base'
require 'battleships'
require 'byebug'

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

    if @name.empty?
      redirect '/game/new?error=name'
    else
      erb :game
    end
  end

  get '/game/place-ship' do
    erb :place_ship
  end

  post '/game/place-ship' do
    @coordinate = params[:coordinate].capitalize.to_s
    @orientation = params[:orientation].to_sym ||= :horizontally
    @@game.player_1.place_ship Ship.cruiser, @coordinate, @orientation
    @board = @@game.own_board_view @@game.player_1
    erb :place_ship
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
