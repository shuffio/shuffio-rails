# TODO: rename 2x super board shuffle teams

seasons = {}

seasons[:spring] = Season.create!(
  name: 'Spring 2018',
  start_date: '2018-04-09',
  playoff_date: '2018-06-10',
  banquet_date: '2018-06-11'
)

seasons[:summer] = Season.create!(
  name: 'Summer 2018',
  start_date: '2018-06-25',
  playoff_date: '2018-08-26',
  banquet_date: '2018-08-27'
)

seasons[:fall] = Season.create!(
  name: 'Fall 2018',
  start_date: '2018-09-10',
  playoff_date: '2018-11-11',
  banquet_date: '2018-11-12'
)

divisions = {}
seasons.each do |k, v|
  divisions[k] = {}

  divisions[k][:mp] = Division.create!(
    name: 'Monday Pilot',
    day_of_week: 1,
    time: '18:30:00',
    season: seasons[k]
  )

  divisions[k][:mc] = Division.create!(
    name: 'Monday Cherry',
    day_of_week: 1,
    time: '19:30:00',
    season: seasons[k]
  )

  divisions[k][:mh] = Division.create!(
    name: 'Monday Hammer',
    day_of_week: 1,
    time: '20:30:00',
    season: seasons[k]
  )

  divisions[k][:tp] = Division.create!(
    name: 'Tuesday Pilot',
    day_of_week: 2,
    time: '18:30:00',
    season: seasons[k]
  )

  divisions[k][:tc] = Division.create!(
    name: 'Tuesday Cherry',
    day_of_week: 2,
    time: '19:30:00',
    season: seasons[k]
  )

  divisions[k][:th] = Division.create!(
    name: 'Tuesday Hammer',
    day_of_week: 2,
    time: '20:30:00',
    season: seasons[k]
  )
end


# Monday Pilot
t = Team.create!(name: 'Back That Tang Up', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Bad News Biscuits')
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Biscuits and Lazy')
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Butter Yo Biscuit', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Future Snowbirds')
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Honey, Butter My Biscuit')
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Hottie Biscotti')
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'MadCap Shuffle')
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'mHUBians')
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Pucks Run Amuck')
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Shuffy The Vampire Slayer')
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Sponge Worthy')
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Tang On The Drum All Day')
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: "Tang's For the Memories")
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'The Puck Stops Here')
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'The Shuffleupaguses')
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Whiskey Tang Foxtrot', starting_elo: 1041, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Aloysius Shuffleupagus')
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'Astronaut Juice', former_names: 'Tangbang', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Binnies Biscuits', starting_elo: 1041, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Dad Bods Aboard')
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'Fashion Police')
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'Murderburgers 2.0', former_names: 'The Murder Burgers', starting_elo: 1084, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'Pack of Strays')
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'RecruiTang')
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'Risky Biscuits (summer)')
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'Send Us Your Disk Pics')
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'Short & Tangy', former_names: 'Beergeeks', starting_elo: 1062, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'The Ruffled Horde')
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'Cannon Shufflers', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'Grubhub', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'I Hate Work', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'Nothin\ but a "G" tang', starting_elo: 951, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'PBD Shufflers', starting_elo: 931, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'Shifty Mother Puckers', starting_elo: 1084, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'Shuffle Puck Up', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'Shuffle State of Mind', starting_elo: 951, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: "Skender's Shufflers", starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'W.H.oosier Mama', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'Walkers + Pills', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'Wild Tangs', starting_elo: 951, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'Zero Pucks Given', starting_elo: 931, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]


# Monday Cherry
t = Team.create!(name: '6151 Richmond St', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Ace Shufflers and Robert')
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'American Shuffle')
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Biscuit Club', former_names: 'USA Curling Team', starting_elo: 951, starting_match_count: 8)
t.divisions << divisions[:spring][:mp]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Del Boca Vista Condo Association', former_names: 'Bonavista Condo Association', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Do The Downes Shuffle')
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Drinkers with a Biscuit Problem')
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Fancy Pants', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Golden GILFs', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Grand Pappy and the Shifty Shafts Retirement Home', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: "Grandma Ain't No Floozy", starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: "Nymeria's Favorites")
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Risk It For The Biscuit')
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Shuffle Birds', former_names: 'The Royal Cluster Pucks', starting_elo: 1041, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Shuffleboard Jones', former_names: 'Northside Lee-side Sliders', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Shufflepuff', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'The Cupid Shufflers', former_names: 'Del Boca Vista All-Stars', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: "We Don't See Why Not")
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'We Thought This Was Quidditch')
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: '31crew', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]

t = Team.create!(name: 'Biscuit Buddies')
t.divisions << divisions[:summer][:mc]

t = Team.create!(name: "Breakin' Biscuits")
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Cherry Pies')
t.divisions << divisions[:summer][:mc]

t = Team.create!(name: 'Disky Business', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]

t = Team.create!(name: 'Gucci Tang, Gucci Tang, Gucci Tang', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Half Acre')
t.divisions << divisions[:summer][:mc]

t = Team.create!(name: 'Powershuff Girls')
t.divisions << divisions[:summer][:mc]

t = Team.create!(name: 'Shuffleupagus', starting_elo: 1062, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]

t = Team.create!(name: 'Hammered Hammers', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]

t = Team.create!(name: 'Big Baller Biscuits', former_names: 'Here for the Beer', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:tc]

t = Team.create!(name: 'Nothing but 10s', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]

t = Team.create!(name: 'Pun-free Shuffling', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Seven Dwarves', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]

t = Team.create!(name: 'Shuffle Now or Puck Later', starting_elo: 951, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]

t = Team.create!(name: 'The Hip Replacements', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]

t = Team.create!(name: 'The Homer', starting_elo: 931, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]

t = Team.create!(name: 'The Tangge-Uppes', starting_elo: 1062, starting_match_count: 8)
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:fall][:mp]


# Monday Hammer
t = Team.create!(name: 'Boca Breeze', former_names: 'Wu Tang Financial', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Dirty Larz and the Boys')
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Gosh Tang It!', former_names: 'Del Boca Breeze')
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Mr. Dr. Nut', starting_elo: 1041, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Nothing But Pepp', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Off The Rails')
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Quite The Kershuffle')
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Shuff It, Shuff It Real Good!', starting_elo: 1017, starting_match_count: 8, image_uri: 'https://scontent-ort2-1.cdninstagram.com/vp/1e48edbe279b6402c7f7891768ad1ef2/5C730728/t51.2885-19/s320x320/42825758_205976053632792_6948660934877380608_n.jpg', instagram_user: 'shuffitrealgood')
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Shuffalo Gang')
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Shuffle Butter', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Shuffleboard of Directors', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Shufflepuffers')
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Slippery Biscuits', starting_elo: 1062, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Straight Outta Shady Pines', former_names: 'Shady Pines Shufflers')
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Super Board Shuffle (change?)')
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'The Chicago Butts', former_names: 'The Risky Biscuits (spring)', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'The Hard Sticks')
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'The Shufflebaes')
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Tu-Tang Clan', starting_elo: 1041, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Bougie Biscuit Boozers', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]

t = Team.create!(name: 'Clawed Monets', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]

t = Team.create!(name: 'FC Pencils')
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Get Rich or Die Shufflin', former_names: 'Everybody Shufflin', starting_elo: 1041, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Motley Crue Tang Clan')
t.divisions << divisions[:summer][:mh]

t = Team.create!(name: 'New Tang Clan', starting_elo: 1041, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]

t = Team.create!(name: 'Big Disc Energy', former_names: 'Nice Disc, How I Pucked Your Mother', starting_elo: 951, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Shuffin Tops')
t.divisions << divisions[:summer][:mh]

t = Team.create!(name: 'Stranger Tangs')
t.divisions << divisions[:summer][:mh]

t = Team.create!(name: 'Tangy Biscuits')
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'We Thought This Was Curling', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]

t = Team.create!(name: 'A and N Mortgage Shuffle', starting_elo: 909, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]

t = Team.create!(name: 'Concrete Curlers', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]

t = Team.create!(name: 'Super Bro Shufflers', former_names: 'Shuff Riders', starting_elo: 931, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]

t = Team.create!(name: 'Survey Says', starting_elo: 931, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]

t = Team.create!(name: 'Tang It!', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'VSOP', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mc]


# Tuesday Pilot
t = Team.create!(name: 'Assisted Living')
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Curling Wannabees', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: "Nuthin' But A G Tang", former_names: 'Excuse My Tang, Disco Biscuits', starting_elo: 951, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Flamingo Fliers', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Harry Donuts')
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Karen from Finance')
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Orca Sliders', starting_elo: 1041, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'SaaSy Shuffle')
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Shia LeShuff')
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'The Unshuffables ', former_names: 'Shuff Shuff Pass')
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Shuffle Butter (spring-only)', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]

t = Team.create!(name: 'Shuffshank Redemption', former_names: 'Board AF', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Summer Shufflerz', starting_elo: 1062, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Swift Biscuits')
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: "Team Bell's Beer", starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'The Biscuit Bangers', former_names: 'JumpShuffle')
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'The Eggplants', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'The Not Its')
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Whalers')
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Hammer Time', former_names: 'The Freds and Ethels', starting_elo: 931, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Highway to the Tanger Zone')
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Six-inch Disks')
t.divisions << divisions[:summer][:tp]

t = Team.create!(name: 'Stick Party', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]

t = Team.create!(name: 'Air Biscuit', starting_elo: 951, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]

t = Team.create!(name: 'Bacardi Party', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]

t = Team.create!(name: 'Flashdance', starting_elo: 909, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]

t = Team.create!(name: "Hangin' Tang", starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tc]

t = Team.create!(name: 'Miami Curling Club', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]

t = Team.create!(name: 'The Squirming Coil', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]

t = Team.create!(name: 'Tropical Bros', starting_elo: 1041, starting_match_count: 8)
t.divisions << divisions[:spring][:tp]


# Tuesday Cherry
t = Team.create!(name: 'All Day I Dream About Shuffling', former_names: 'Super Bowl Shuffle', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Biscuit Boiz', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Boardinary People')
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Chi Town Shufflers', starting_elo: 951, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Club Moist')
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Guido and the Biscott Bunch', former_names: 'The Ez Pug Shufflers', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'I thought this was curling')
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Limp Biscuits', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Nunya Biscuits', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Shuffalumps & Woozles')
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Sponsored by Lemmings', former_names: 'Shame Latrine', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Summer of Jim')
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Tang Bang', starting_elo: 1062, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Tangers & Bangers', former_names: 'Boujee Babeez')
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'The TangaROOS', starting_elo: 1041, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Truffle Shuffle', starting_elo: 1062, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'We Be Shufflin')
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Fresh out of the Kitchen', former_names: "I've Shuffled and Can't Get Up")
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: "Bag O' Disks", starting_elo: 931, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]

t = Team.create!(name: "Fat Lil' Girls", starting_elo: 931, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]

t = Team.create!(name: 'Handynasty', starting_elo: 1041, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]

t = Team.create!(name: 'Hot Stuff and the Brady Bunch', starting_elo: 951, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]

t = Team.create!(name: 'Lost in the Shuffle', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]

t = Team.create!(name: 'Midwest Opeas', starting_elo: 931, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]

t = Team.create!(name: 'Shuffle Me Timbers', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]

t = Team.create!(name: 'Team Avon', starting_elo: 1041, starting_match_count: 8)
t.divisions << divisions[:spring][:tc]


# Tuesday Hammer
t = Team.create!(name: 'All Your Biscuit Are Belong To Us', former_names: 'Goonies', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Cocktails & Dreams', former_names: 'Chi City Shufflers', starting_elo: 1062, starting_match_count: 8)
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'DDIR')
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Free Agent Team')
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Gutter Punks', starting_elo: 951, starting_match_count: 8)
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'ICU Shfflin')
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Itstimeforyourkiss', starting_elo: 1062, starting_match_count: 8)
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Lost in the Shuffle')
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Resting Biscuit Face', starting_elo: 1041, starting_match_count: 8)
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Risky Biscuits (fall)')
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Space Force', former_names: 'Abby-Normal')
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Strictly Biscuits', starting_elo: 1062, starting_match_count: 8)
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Tang You For Being A Friend', starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'The Shuffle Kerfuffle', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Trivia Night Was Full')
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Glimp Bizkits')
t.divisions << divisions[:summer][:th]

t = Team.create!(name: 'IV Leaguers', starting_elo: 951, starting_match_count: 8)
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]

t = Team.create!(name: 'Mr. Biscuit and the Cabana Boys')
t.divisions << divisions[:summer][:th]

t = Team.create!(name: 'Must Tang Sally')
t.divisions << divisions[:summer][:th]

t = Team.create!(name: "No Sleep 'til Boca", starting_elo: 973, starting_match_count: 8)
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]

t = Team.create!(name: 'Schlep')
t.divisions << divisions[:summer][:th]

t = Team.create!(name: 'Super Board Shuffle', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]

t = Team.create!(name: 'Synammon Biscuits')
t.divisions << divisions[:summer][:th]

t = Team.create!(name: 'Unruffle 4 Shuffle')
t.divisions << divisions[:summer][:th]

t = Team.create!(name: '4EG Shufflers', starting_elo: 951, starting_match_count: 8)
t.divisions << divisions[:spring][:th]

t = Team.create!(name: 'Dog Biscuits', starting_elo: 997, starting_match_count: 8)
t.divisions << divisions[:spring][:th]

t = Team.create!(name: 'Riskit 4 the Biscuit', starting_elo: 951, starting_match_count: 8)
t.divisions << divisions[:spring][:th]

t = Team.create!(name: 'Son of a Biscuit', starting_elo: 931, starting_match_count: 8)
t.divisions << divisions[:spring][:th]

t = Team.create!(name: 'Tangled Up In Blue', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:th]

t = Team.create!(name: 'The Bad Apples', starting_elo: 931, starting_match_count: 8)
t.divisions << divisions[:spring][:th]

t = Team.create!(name: 'The Grundles', starting_elo: 1017, starting_match_count: 8)
t.divisions << divisions[:spring][:th]

t = Team.create!(name: 'Too Legit 2 Biscuit', starting_elo: 931, starting_match_count: 8)
t.divisions << divisions[:spring][:th]
