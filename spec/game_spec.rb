require 'game'

describe Game do
  describe '#attack' do
    let(:game) { Game.new }
    let(:player_two) { double :player_two }
    
    it 'calls the receive_damage method' do
      expect(player_two).to receive(:receive_damage)
      game.attack(player_two)
    end
  end
end