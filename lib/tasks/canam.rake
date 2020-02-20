namespace :canam do
  desc 'Create Tournament'
  task create_tournament: :environment do
    canam = Tournament.find_or_create_by(
      name: 'Can-Am 2020',
      start_time: '2020-03-07 14:00:00', # 9:00am EST
      location: Location.find_by(name: 'St. Petersburg Shuffleboard Club'),
      format: 'canam'
    )

    usa = TournamentGroup.find_or_create_by(
      tournament: canam,
      name: 'United States'
    )

    can = TournamentGroup.find_or_create_by(
      tournament: canam,
      name: 'Canada'
    )

    6.times do |i|
      TournamentRound.find_or_create_by(
        tournament_group: usa,
        number: i + 1,
        format: 'group'
      )

      TournamentRound.find_or_create_by(
        tournament_group: can,
        number: i + 1,
        format: 'group'
      )
    end
  end
end
