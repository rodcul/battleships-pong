require 'sinatra/base'
require 'battleships'


class BattleshipsWeb < Sinatra::Base
  @@game = Game.new Player, Board
  @@turn = 'player_1'
  set :public_folder, 'public'
  set :views, proc { File.join(root, '..', 'views') }
  set :raise_errors, false
  set :show_exceptions, false
  enable :sessions
  set :session_secret, 'bonkers'
  set :environment, :production


  post '/' do
    'post'
  end

  get '/' do
    erb :index
  end

  get '/player1' do
    session['player'] = 'player_1'
    redirect '/game/place-ship'
  end

  get '/player2' do
    session['player'] = 'player_2'
    redirect '/game/place-ship'
  end

  get '/game/place-ship' do
    @error = params[:error]
    @player = session['player']
    if @error.nil?
      @message = 'Place your ship'
    else
      @message = 'Error: ship overlay or outside board (try again)'
    end

    @own_board = @@game.own_board_view @@game.send(@player)
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
    @message = 'Place your ship'
    @own_board = @@game.own_board_view @@game.send(@player)
    erb :place_ship
  end

  get '/game/fire' do
    @player = session['player']

    @error = params[:error]
    if @error.nil?
      @message = 'Enter a coordinate to fire at'
    else
      @message = '<div class="alert alert-danger" role="alert">Error: wait your turn</div>'
    end

    @own_board = @@game.own_board_view @@game.send(@player)
    @opponent_board = @@game.opponent_board_view @@game.send(@player)
    erb :fire_at_ship
  end

  post '/game/fire' do
    @player = session['player']

    if @@game.has_winner?
      redirect to '/game/winner'
    elsif @@turn != @player
      redirect to '/game/fire?error=wait'
    else
      @coordinate = params[:coordinate].capitalize.to_sym
      @@game.send(@player).shoot @coordinate
      @own_board = @@game.own_board_view @@game.send(@player)
      @opponent_board = @@game.opponent_board_view @@game.send(@player)
      @@turn = @@turn == 'player_1' ? 'player_2' : 'player_1'
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
