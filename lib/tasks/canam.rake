namespace :canam do
  desc 'Create Tournament'
  task create_tournament: :environment do
    stpete = Location.find_by(name: 'St. Petersburg Shuffleboard Club')

    canam = Tournament.find_or_create_by(
      name: 'Mirror Lake 2021',
      start_time: '2021-03-06 14:00:00', # 9:00am EST
      location: stpete,
      format: 'canam'
    )

    group = TournamentGroup.find_or_create_by(
      tournament: canam,
      name: 'Group Play'
    )

    6.times do |i|
      TournamentRound.find_or_create_by(
        tournament_group: group,
        number: i + 1,
        format: 'group'
      )
    end
  end
end
