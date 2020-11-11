class Player

  DEFAULT_HIT_POINTS = 60

  def initialize(name)
    @name = name
    @hit_points = DEFAULT_HIT_POINTS
  end

  def name
    @name
  end

  def hit_points
    @hit_points
  end

  def attack(player)
    player.receive_damage
  end

  def receive_damage
    @hit_points -= 10
  end
end