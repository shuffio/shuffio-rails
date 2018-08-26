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

# Monday Pilot
Team.create!(
  [
    { name: 'Fashion Police' },
    { name: 'Butter Yo Biscuit' },
    { name: 'Short + Tangy' },
    { name: 'Honey, Butter My Biscuit' },
    { name: "Binnie's Biscuits" },
    { name: 'Whiskey Tang Foxtrot' },
    { name: 'Murderburgers 2.0' },
    { name: 'Back That Tang Up' },
    { name: 'Astronaut Juice' },
    { name: "We Don't See Why Not" },
    { name: 'Tang It!' },
    { name: 'Risk It for the Biscuit' },
    { name: 'Dad Bods Aboard' },
    { name: 'The Ruffled Horde' },
    { name: 'Send Us Your Disc Pics' },
    { name: 'Aloysius Shuffleupagus' },
    { name: 'Shuffy the Vampire Slayer' },
    { name: 'Pack of Strays' },
    { name: 'Risky Biscuits' },
    { name: 'Recruitang' }
  ]
)

# Monday Cherry
Team.create!(
  [
    { name: 'Biscuit Buddies' },
    { name: 'Mr. Dr. Nut' },
    { name: 'The Cupid Shufflers' },
    { name: 'Shufflepuff' },
    { name: 'Fancy Pants' },
    { name: '31 Crew' },
    { name: 'Ace Shufflers + Robert' },
    { name: 'Golden Gilfs' },
    { name: 'Gucci Tang Gucci Tang Gucci Tang' },
    { name: 'Shuffleboard Jones' },
    { name: 'Shufflupagus' },
    { name: '6151 Richmond St.' },
    { name: "Breakin' Biscuits" },
    { name: 'Royal Cluster Pucks' },
    { name: 'Grand Pappy and the Shifty' },
    { name: 'Half Acre AKA Jeff' },
    { name: 'Disky Business' },
    { name: 'Cherry Pies' },
    { name: 'VSOP' },
    { name: 'Powershuff Girls' }
  ]
)

# Monday Hammer
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

# Tuesday Pilot
Team.create!(
  [
    { name: 'Team Bells Beer' },
    { name: 'Orca Sliders' },
    { name: 'Curling Wannabeese' },
    { name: 'Excuse My Tang' },
    { name: 'Swift Biscuits' },
    { name: 'Flamingo Fliers' },
    { name: 'Hammer Time' },
    { name: 'Highway to the Tangerzone' },
    { name: 'The Shuffleupaguses' },
    { name: 'Summer Shufflerz' },
    { name: 'The Eggplants' },
    { name: 'Shuff Shuff Pass' },
    { name: 'Shia Leshuff' },
    { name: 'Madcap Shuffle' },
    { name: 'Whalers' },
    { name: 'Jumpshuffle' },
    { name: 'Six Inch Disks' },
    { name: 'Stick Party' },
    { name: 'Karen from Finance' },
    { name: 'Board AF' }
  ]
)

# Tuesday Cherry
Team.create!(
  [
    { name: 'Gma Aint No Floozy' },
    { name: 'Biscuit Boiz' },
    { name: 'Tang Bang' },
    { name: 'Super Bowl Shuffle' },
    { name: 'Truffle Shuffle' },
    { name: 'Pun-Free Shuffling' },
    { name: 'Sponsored by Lemmings' },
    { name: "Hangin' Tang" },
    { name: 'Bonavista Condo Assoc' },
    { name: 'The Tangaroos' },
    { name: 'Guido + the Biscotti Bunch' },
    { name: "I've Shuffled & Can't Get Up" },
    { name: 'The Limp Biscuits' },
    { name: 'Big Baller Biscuits' },
    { name: 'Mhubians' },
    { name: 'Shuffle Butter' },
    { name: 'Boardinary People' },
    { name: 'Boujee Babeez' },
    { name: 'Nunya Biscuits' },
    { name: 'Chi Town Shufflers' }
  ]
)

# Tuesday Hammer
Team.create!(
  [
    { name: "It's Time for Your Kiss" },
    { name: 'Resting Biscuit Face' },
    { name: 'DDIR' },
    { name: 'Tang you for Being a Friend' },
    { name: 'Strictly Biscuits' },
    { name: 'All Yr Biscuits R Belong 2 Us' },
    { name: 'No Sleep til Boca' },
    { name: 'Synnamon Biscuits' },
    { name: 'The Shuffle Kerfuffle' },
    { name: 'Mr Biscuit + the Cabana Boys' },
    { name: 'Del Boca Breeze' },
    { name: 'Super Board Shuffle' },
    { name: 'Space Force' },
    { name: 'Must Tang Sally' },
    { name: 'Cocktails + Dreamers' },
    { name: 'Schlep' },
    { name: 'Glimp Biskits' },
    { name: 'Unruffle 4 Shuffle' },
    { name: 'Gutter Punks' },
    { name: 'I.V. Leaguers' }
  ]
)