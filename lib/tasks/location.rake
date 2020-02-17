namespace :location do
  desc 'Seed location information and update Matches to new schema'
  task seed_and_update: :environment do
    load Rails.root.join('db', 'seeds', 'locations.rb')

    chicago = Location.find_by(name: 'Royal Palms Chicago')

    # Update existing matches to use the new models
    Match.all.each do |m|
      next unless m.location

      court = Court.find_by(name: m.location, location: chicago)
      m.update(court: court, location: nil) if court
    end
  end
end
