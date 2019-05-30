class Game < ApplicationRecord
  belongs_to :match
  belongs_to :yellow_team, class_name: 'Team', optional: true
  belongs_to :black_team, class_name: 'Team', optional: true
  after_initialize :default_values

  # TODO: game must be 1-3

  private

  def default_values
    self.frames ||= []
  end
end
