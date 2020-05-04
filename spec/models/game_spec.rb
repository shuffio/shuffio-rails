require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:match) { Match.new }
  let(:yellow_team) { Team.new }
  let(:black_team) { Team.new }
  let(:frame_game) { Game.new(match: match, yellow_team: yellow_team, black_team: black_team) }
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

      xit 'returns false when a game went to 75 but had more frames' do
        # TODO: there are actually more complications we need to account for once a game hits 75
        point_game.update(frames: [[72, 65], [80, 80], [60, 80]])
        expect(point_game.complete?).to be_falsey
      end

      xit 'returns true when a game went to 75, no logner is, but is complete' do
        # TODO: there are actually more complications we need to account for once a game hits 75
        point_game.update(frames: [[72, 65], [80, 80], [60, 80], [60, 70]])
        expect(point_game.complete?).to be_truthy
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

  describe '#next_frame' do
    it 'is on frame 1 when no frames completed' do
      expect(frame_game.next_frame).to eq(1)
    end

    it 'is on frame 2 when after 1 frame completed' do
      frame_game.update(frames: [[7, 0]])
      expect(frame_game.next_frame).to eq(2)
    end
  end

  describe '#next_hammer' do
    it 'returns correct hammer in 2nd frame' do
      frame_game.update(frames: [[7, 0]])
      expect(frame_game.next_hammer).to eq('yellow')
    end

    it 'returns correct hammer in 3rd frame' do
      frame_game.update(frames: [[7, 0], [7, 0]])
      expect(frame_game.next_hammer).to eq('black')
    end
  end

  describe '#hammer_for_frame' do
    it 'returns correct hammers for singles' do
      expect(Game.hammer_for_frame(1, 'standard_singles')).to eq('black')
      expect(Game.hammer_for_frame(2, 'standard_singles')).to eq('yellow')
      expect(Game.hammer_for_frame(3, 'standard_singles')).to eq('black')
      expect(Game.hammer_for_frame(4, 'standard_singles')).to eq('yellow')
    end

    it 'returns correct hammers for doubles' do
      expect(Game.hammer_for_frame(1, 'standard_doubles')).to eq('black')
      expect(Game.hammer_for_frame(2, 'standard_doubles')).to eq('black')
      expect(Game.hammer_for_frame(3, 'standard_doubles')).to eq('yellow')
      expect(Game.hammer_for_frame(4, 'standard_doubles')).to eq('yellow')
    end

    it 'returns correct hammers for palms' do
      expect(Game.hammer_for_frame(1, 'palms_doubles')).to eq('black')
      expect(Game.hammer_for_frame(2, 'palms_doubles')).to eq('yellow')
      expect(Game.hammer_for_frame(3, 'palms_doubles')).to eq('yellow')
      expect(Game.hammer_for_frame(4, 'palms_doubles')).to eq('black')
    end
  end

  describe '#frames_with_meta' do
    it 'returns an array of hashes for 8 frames' do
      expect(frame_game.frames_with_meta.is_a?(Array)).to be_truthy
      expect(frame_game.frames_with_meta.first.is_a?(Hash)).to be_truthy
      expect(frame_game.frames_with_meta.size).to eq(8)
    end

    it 'has padding when needed' do
      frame_game.update(frames: [[8, 0], [8, 8], [15, 8], [15, 15], [22, 15], [22, 22]])
      expect(frame_game.frames_with_meta(4).last[:yellow_score]).to be(nil)
      expect(frame_game.frames_with_meta(4).last[:black_score]).to be(nil)
      expect(frame_game.frames_with_meta(4, false).last[:yellow_score]).to be(22)
      expect(frame_game.frames_with_meta(4, false).last[:black_score]).to be(22)
    end
  end

  describe '#winner' do
    it 'returns nil on unfinished game' do
      expect(frame_game.winner).to be(nil)
    end

    it 'returns nil on tied game' do
      frame_game.update(frames: [[8, 0], [8, 8], [15, 8], [15, 15], [22, 15], [22, 22], [22, 12], [12, 12]], allow_ties: true)
      expect(frame_game.winner).to be(nil)
    end

    it 'returns yellow_team if they won' do
      frame_game.update(frames: [[8, 0], [8, 8], [15, 8], [15, 15], [22, 15], [22, 22], [22, 12], [22, 12]])
      expect(frame_game.winner).to be(yellow_team)
    end

    it 'returns black_team if they won' do
      frame_game.update(frames: [[8, 0], [8, 8], [15, 8], [15, 15], [22, 15], [22, 22], [22, 12], [22, 27]])
      expect(frame_game.winner).to be(black_team)
    end
  end

  describe '#series_score' do
    it 'returns 0-0 for no completed games' do
      expect(frame_game.series_score).to eq([0, 0])
    end

    # TODO: need to persist game objects to be able to look at match.games
    xit 'returns 1-0 if yellow won the only game in the match'
    xit 'returns 2-0 if yellow won multiple games in the match'
  end

  describe 'validations' do
    it 'errors if game has no max frames or points' do
      expect { Game.create!(match: match, number: 1, max_points: nil, max_frames: nil) }.to raise_error(
        an_instance_of(ActiveRecord::RecordInvalid).and(having_attributes(message: 'Validation failed: must have max_points or max_frames'))
      )
    end

    it 'errors if game number missing' do
      expect { Game.create!(match: match, number: nil) }.to raise_error(
        an_instance_of(ActiveRecord::RecordInvalid).and(having_attributes(message: 'Validation failed: Number must be positive'))
      )
    end

    it 'errors if ties allowed in point game' do
      expect { Game.create!(match: match, number: 1, allow_ties: true, max_frames: nil, max_points: 75) }.to raise_error(
        an_instance_of(ActiveRecord::RecordInvalid).and(having_attributes(message: 'Validation failed: point games cannot tie'))
      )
    end
  end
end
