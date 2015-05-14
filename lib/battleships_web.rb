require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  @@game = Game.new Player, Board
  set :views, proc { File.join(root, '..', 'views') }
  # set :raise_errors, false
  # set :show_exceptions, false

  enable :sessions
  set :session_secret, 'bonkers'

  get '/' do
    erb :index
  end


get '/player1' do
  session['player'] = "player_1"
  redirect '/game/new'
end


get '/player2' do
  session['player'] = "player_2"
  redirect '/game/new'
end

  get '/game/new' do
    @error = params[:error]

    if @error.nil?
      @message = "What's your name?"
    else
      @message = 'Please put in a valid name'
    end
    erb :game_new
  end

  post '/game' do
    @player = session['player']
    @board = @@game.own_board_view @@game.send(@player)
    @name = params[:name]

    if @name.empty?
      redirect '/game/new?error=name'
    else
      erb :game
    end
  end

  get '/game/place-ship' do
    @error = params[:error]
    @player = session['player']
    if @error.nil?
      @message = "Place your ship"
    else
      @message = 'Error: ship overlay or outside board (try again)'
    end

    @board = @@game.own_board_view @@game.send(@player)
    erb :place_ship
  end

  error do
    redirect to '/game/place-ship?error=general'
  end

  post '/game/place-ship' do
    @player = session['player']
    @coordinate = params[:coordinate].capitalize.to_s
    @orientation = params[:orientation].to_sym
    @@game.send(@player).place_ship Ship.cruiser, @coordinate, @orientation
    @message = "Place your ship"
    @own_board = @@game.own_board_view @@game.send(@player)
    erb :place_ship
  end

  get '/game/fire' do
    @player = session['player']
    @own_board = @@game.own_board_view @@game.send(@player)
    @opponent_board = @@game.opponent_board_view @@game.send(@player)
    erb :fire_at_ship
  end

  post '/game/fire' do
    if @@game.has_winner?
      redirect to '/game/winner'
    else
      @player = session['player']
      @coordinate = params[:coordinate].capitalize.to_sym
      @@game.send(@player).shoot @coordinate
      @own_board = @@game.own_board_view @@game.send(@player)
      @opponent_board = @@game.opponent_board_view @@game.send(@player)
      erb :fire_at_ship
    end
  end

  get '/game/winner' do
    @player = session['player']
    erb :you_win
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
