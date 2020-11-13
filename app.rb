require 'sinatra/base'
require_relative './lib/game.rb'
require_relative './lib/player.rb'

class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, 'makers'

  get '/' do
    erb(:index)
  end

  post '/names' do
    player_one = Player.new(params[:player_1_name])
    player_two = Player.new(params[:player_2_name])
    $game = Game.new(player_one, player_two)
    redirect('/play')
  end

  get '/play' do
    @game = $game
    redirect('/outcome') if @game.status == 'complete'
    erb(:play)
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.opponent_of(@game.current_turn))
    erb(:attack)
  end

  post '/switch-turns' do
    $game.switch_turns
    redirect('/play')
  end

  get '/outcome' do
    @game = $game
    erb(:outcome)
  end

  run! if app_file == $0
end