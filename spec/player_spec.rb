require 'player'

describe Player do
  let(:player_one) { Player.new('AI') }

  describe '#name' do
    it 'has a name attribute' do
      expect(player_one.name).to eq('AI')
    end
  end
end