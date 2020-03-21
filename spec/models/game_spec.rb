require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:new_game) { Game.new(game_type: :palms_doubles) }
  let(:tie_allowed) { Game.new(game_type: :palms_doubles, frames: [[8,0],[8,8],[15,8],[15,15],[22,15],[22,22],[22,12],[12,12]], allow_ties: true) }
  let(:tie_not_allowed) { Game.new(game_type: :palms_doubles, frames: [[8,0],[8,8],[15,8],[15,15],[22,15],[22,22],[22,12],[12,12]], allow_ties: false) }
  let(:tie_allowed_nine) { Game.new(game_type: :palms_doubles, frames: [[8,0],[8,8],[15,8],[15,15],[22,15],[22,22],[22,12],[12,12],[20,12]], allow_ties: true) }
  let(:tie_not_allowed_nine) { Game.new(game_type: :palms_doubles, frames: [[8,0],[8,8],[15,8],[15,15],[22,15],[22,22],[22,12],[12,12],[20,12]], allow_ties: false) }

  describe '#complete?' do
    # Frame Games
    it 'new game is not yet complete' do
      expect(new_game.complete?).to be_falsey
    end

    it 'returns true if ties allowed' do
      expect(tie_allowed.complete?).to be_truthy
    end

    it 'returns false if ties not allowed' do
      expect(tie_not_allowed.complete?).to be_falsey
    end

    it 'returns false if ties allowed and 9th frame' do
      expect(tie_allowed_nine.complete?).to be_falsey
    end

    it 'returns false if ties not allowed and 9th frame' do
      expect(tie_not_allowed_nine.complete?).to be_falsey
    end

    # TODO: Points Games
    # TODO: Frame + Points
  end

  it 'is on frame 1' do
    expect(new_game.frame).to eq(1)
  end

  it 'black has hammer' do
    expect(new_game.next_hammer).to eq('black')
  end
end
