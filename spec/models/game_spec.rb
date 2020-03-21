require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:frame_game) { Game.new }

  describe '#complete?' do
    # Frame Games
    it 'new game is not yet complete' do
      expect(frame_game.complete?).to be_falsey
    end

    it 'returns true if ties allowed' do
      frame_game.update(frames: [[8, 0], [8, 8], [15, 8], [15, 15], [22, 15], [22, 22], [22, 12], [12, 12]], allow_ties: true)
      expect(frame_game.complete?).to be_truthy
    end

    it 'returns false if ties not allowed' do
      frame_game.update(frames: [[8, 0], [8, 8], [15, 8], [15, 15], [22, 15], [22, 22], [22, 12], [12, 12]], allow_ties: false)
      expect(frame_game.complete?).to be_falsey
    end

    it 'returns false if ties allowed and 9th frame' do
      frame_game.update(frames: [[8, 0], [8, 8], [15, 8], [15, 15], [22, 15], [22, 22], [22, 12], [12, 12], [20, 12]], allow_ties: true)
      expect(frame_game.complete?).to be_falsey
    end

    it 'returns false if ties not allowed and 9th frame' do
      frame_game.update(frames: [[8, 0], [8, 8], [15, 8], [15, 15], [22, 15], [22, 22], [22, 12], [12, 12], [20, 12]], allow_ties: false)
      expect(frame_game.complete?).to be_falsey
    end

    it 'returns false if ties allowed after 10 frames of standard doubles' do
      frame_game.update(frames: [[8, 0], [8, 8], [15, 8], [15, 15], [22, 15], [22, 22], [22, 12], [12, 12], [20, 12], [20, 20]], allow_ties: true, game_type: :standard_doubles)
      expect(frame_game.complete?).to be_falsey
    end

    it 'returns true if ties not allowed after 10 frames of palms doubles' do
      frame_game.update(frames: [[8, 0], [8, 8], [15, 8], [15, 15], [22, 15], [22, 22], [22, 12], [12, 12], [20, 12], [20, 12]], allow_ties: false, game_type: :palms_doubles)
      expect(frame_game.complete?).to be_truthy
    end

    # TODO: Points Games
    # TODO: Frame + Points
  end

  it 'is on frame 1' do
    expect(frame_game.frame).to eq(1)
  end

  it 'black has hammer' do
    expect(frame_game.next_hammer).to eq('black')
  end
end
