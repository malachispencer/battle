class Game
  attr_reader :current_turn, :winner, :loser

  def self.create(player_one, player_two)
    @game = Game.new(player_one, player_two)
  end

  def self.instance
    @game
  end

  def initialize(player_one, player_two)
    @players = [player_one, player_two]
    @current_turn = player_one
    @winner = nil
    @loser = nil
  end

  def player_one
    @players.first
  end

  def player_two
    @players.last
  end

  def attack(player)
    player.receive_damage
  end

  def switch_turns
    @current_turn = opponent_of(current_turn)
  end

  def opponent_of(current_turn_player)
    @players.find { |player| player != current_turn_player }
  end

  def status
    if winner?
      assign_outcomes
      "complete"
    end
  end

  private

  def winner?
    @players.any? { |player| player.hit_points <= 0 }
  end

  def assign_outcomes
    @players.each do |player|
      @winner = player if player.hit_points > 0
      @loser = player if player.hit_points <= 0
    end
  end
end