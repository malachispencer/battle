require 'player'

describe Player do
  let(:player_one) { Player.new('AI') }
  let(:player_two) { Player.new('Human') }

  describe '#initialize' do
    it 'has a name attribute' do
      expect(player_one.name).to eq('AI')
    end

    it 'sets hit points to 60 by default' do
      expect(player_one.hit_points).to eq(60)
    end
  end

  describe '#attack' do
    it 'calls the receive_damage method' do
      expect(player_two).to receive(:receive_damage)
      player_one.attack(player_two)
    end
  end

  describe '#receive_damage' do
    it "reduces the player's hit points by 10" do
      expect { player_two.receive_damage }.to change { player_two.hit_points }.by(-10)
    end
  end
end