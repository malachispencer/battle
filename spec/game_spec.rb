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
      allow(game).to receive(:winner?) { false }
      expect(player_two).to receive(:receive_damage)
      game.attack(player_two)
    end
  end

  describe '#status' do
    it 'calls the winner? method' do
      expect(game).to receive(:winner?)
      game.status
    end

    it 'calls assign_outcomes if winner? returns true' do
      allow(player_one).to receive(:hit_points) { 10 }
      allow(player_two).to receive(:hit_points) { 0 }
      expect(game).to receive(:assign_outcomes)
      game.status
    end

    it "returns 'complete' if there is a winner and loser" do
      allow(player_one).to receive(:hit_points) { 10 }
      allow(player_two).to receive(:hit_points) { 0 }
      expect(game.status).to eq('complete')
    end

    it 'changes winner from nil to winner if game is complete' do
      allow(player_one).to receive(:hit_points) { 10 }
      allow(player_two).to receive(:hit_points) { 0 }
      expect { game.status }.to change { game.winner }.from(nil).to(player_one)
    end

    it 'changes loser from nil to loser if game is complete' do
      allow(player_one).to receive(:hit_points) { 10 }
      allow(player_two).to receive(:hit_points) { 0 }
      expect { game.status }.to change { game.loser }.from(nil).to(player_two)
    end
  end
end