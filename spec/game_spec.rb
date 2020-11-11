require 'game'

describe Game do
  let(:player_one) { double :player_one }
  let(:player_two) { double :player_two }
  let(:game) { Game.new(player_one, player_two) }

  describe '#initialize' do
    it 'retrieves the first player' do
      expect(game.player_one).to eq(player_one)
    end

    it 'retrieves the second player' do
      expect(game.player_two).to eq(player_two)
    end
  end

  describe '#current_turn' do
    it 'starts as player_one' do
      expect(game.current_turn).to eq(player_one)
    end
  end

  describe '#switch_turns' do
    it 'switches whose turn it is after an attack' do
      game.switch_turns
      expect(game.current_turn).to eq(player_two)
    end
  end

  describe '#attack' do
    it 'calls the receive_damage method' do
      expect(player_two).to receive(:receive_damage)
      game.attack(player_two)
    end
  end
end