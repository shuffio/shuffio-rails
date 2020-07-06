require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test 'blank short name' do
    team = Team.create(name: 'A witty shuffle board pun here.', short_name: '')
    assert team.short_name.nil?
  end

  test 'nil short name' do
    team = Team.create(name: 'A witty shuffle board pun here.', short_name: nil)
    assert team.short_name.nil?
  end

  test 'supply short name' do
    team = Team.create(name: 'A witty shuffle board pun here.', short_name: 'Shufflepun')
    assert_equal 'Shufflepun', team.short_name
  end
end
