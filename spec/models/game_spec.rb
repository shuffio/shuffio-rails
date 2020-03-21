require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:frame_game) { Game.new }
  let(:point_game) { Game.new(max_points: 75, max_frames: nil) }
  let(:point_or_frame_game) { Game.new(max_points: 75, max_frames: 8) }

  describe '#complete?' do
    describe 'frame game' do
      it 'returns false on new game' do
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
    end

    describe 'point game' do
      it 'returns false on new game' do
        expect(point_game.complete?).to be_falsey
      end

      it 'returns true at 75 points' do
        point_game.update(frames: [[75, 74]])
        expect(point_game.complete?).to be_truthy
      end

      it 'returns false when tied with odd frames' do
        point_game.update(frames: [[75, 75]])
        expect(point_game.complete?).to be_falsey
      end

      it 'returns false when tied with even frames' do
        point_game.update(frames: [[75, 75], [75, 75]])
        expect(point_game.complete?).to be_falsey
      end

      it 'returns false when a game went to 75 but is no longer there' do
        # TODO: verify this should be incomplete
        point_game.update(frames: [[72, 65], [80, 80], [60, 70]])
        expect(point_game.complete?).to be_falsey
      end
    end

    describe 'point or frame game' do
      it 'returns false on new game' do
        expect(point_or_frame_game.complete?).to be_falsey
      end

      it 'returns true at 75 points' do
        point_or_frame_game.update(frames: [[75, 74]])
        expect(point_or_frame_game.complete?).to be_truthy
      end

      it 'returns true after 8 frames' do
        point_or_frame_game.update(frames: [[8, 0], [8, 8], [15, 8], [15, 15], [22, 15], [22, 22], [22, 12], [22, 12]])
        expect(point_or_frame_game.complete?).to be_truthy
      end

      # TODO: can point/frame games end in a tie?
    end
  end

  # TODO: all validations
  xit 'errors if ties allowed' do
    expect { point_game.update(allow_ties: true) }.to raise_error
  end

  it 'is on frame 1' do
    expect(frame_game.frame).to eq(1)
  end

  it 'black has hammer' do
    expect(frame_game.next_hammer).to eq('black')
  end
end
