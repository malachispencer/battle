class Game
  attr_reader :current_turn, :winner

  def initialize(player_one, player_two)
    @players = [player_one, player_two]
    @current_turn = player_one
    @winner = nil
  end

  def player_one
    @players.first
  end

  def player_two
    @players.last
  end

  def attack(player)
    player.receive_damage
    assign_winner
  end

  def switch_turns
    @current_turn = opponent_of(current_turn)
  end

  def opponent_of(current_turn_player)
    @players.find { |player| player != current_turn_player }
  end

  def assign_winner
    @players.each do |player|
      @winner = opponent_of(player) if player.hit_points <= 0
    end
  end
end