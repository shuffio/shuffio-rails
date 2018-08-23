# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Season.create!(
  name: 'Summer 2018',
  start_date: '2018-06-25',
  playoff_date: '2018-08-26',
  banquet_date: '2018-08-27'
)

Division.create!(
  name: 'Monday Hammer',
  day_of_week: 1,
  time: '20:30:00'
)

Team.create!(
  [
    { name: 'Boca Breeze', former_names: 'Wu Tang Financial' },
    { name: 'Bougie Biscuit Boozers' },
    { name: 'Clawed Monets' },
    { name: 'FC Pencils', former_names: 'Limp Biscuits' },
    { name: 'Get Rich or Die Shufflin', former_names: "Everybody Shufflin'" },
    { name: 'Motley Crue Tang Clan' },
    { name: 'New-Tang Clan' },
    { name: 'Nice Disc', former_names: 'How I Pucked Your Mother' },
    { name: 'Nothing But Pepp' },
    { name: 'Shady Pines Shufflers' },
    { name: 'Shuffin Tops' },
    { name: 'Shuff It, Shuff It, Real Good!' },
    { name: 'Shuffleboard of Directors' },
    { name: 'Shufflepuffers' },
    { name: 'Slippery Biscuits' },
    { name: 'Stranger Tangs' },
    { name: 'Tangy Biscuits' },
    { name: 'The Chicago Butts', former_names: 'The Risky Biscuits' },
    { name: 'Tu-Tang Clan' },
    { name: 'We Thought This Was Curling' }
  ]
)