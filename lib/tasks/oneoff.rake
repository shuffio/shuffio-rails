namespace :oneoff do
  desc 'Add Starting ELOs to Spring teams'
  task starting_elo: :environment do
    Team.find_by(name: 'Back That Tang Up').update(starting_elo: 1017)
    Team.find_by(name: 'Butter Yo Biscuit').update(starting_elo: 997)
    Team.find_by(name: 'Whiskey Tang Foxtrot').update(starting_elo: 1041)
    Team.find_by(name: 'Astronaut Juice').update(starting_elo: 1017)
    Team.find_by(name: 'Binnies Biscuits').update(starting_elo: 1041)
    Team.find_by(name: 'Murderburgers 2.0').update(starting_elo: 1084)
    Team.find_by(name: 'Tangy Millies').update(starting_elo: 1062)
    Team.find_by(name: 'Cannon Shufflers').update(starting_elo: 1017)
    Team.find_by(name: 'Grubhub').update(starting_elo: 997)
    Team.find_by(name: 'I Hate Work').update(starting_elo: 973)
    Team.find_by(name: 'Nothin\ but a "G" tang').update(starting_elo: 951)
    Team.find_by(name: 'PBD Shufflers').update(starting_elo: 931)
    Team.find_by(name: 'Shifty Mother Puckers').update(starting_elo: 1084)
    Team.find_by(name: 'Shuffle Puck Up').update(starting_elo: 973)
    Team.find_by(name: 'Shuffle State of Mind').update(starting_elo: 951)
    Team.find_by(name: "Skender's Shufflers").update(starting_elo: 997)
    Team.find_by(name: 'W.H.oosier Mama').update(starting_elo: 973)
    Team.find_by(name: 'Walkers + Pills').update(starting_elo: 997)
    Team.find_by(name: 'Wild Tangs').update(starting_elo: 951)
    Team.find_by(name: 'Zero Pucks Given').update(starting_elo: 931)
    Team.find_by(name: '6151 Richmond St').update(starting_elo: 997)
    Team.find_by(name: 'Biscuit Club').update(starting_elo: 951)
    Team.find_by(name: 'Del Boca Vista Condo Association').update(starting_elo: 997)
    Team.find_by(name: 'Fancy Pants').update(starting_elo: 997)
    Team.find_by(name: 'Golden GILFs').update(starting_elo: 997)
    Team.find_by(name: 'Grand Pappy and the Shifty Shafts Retirement Home').update(starting_elo: 997)
    Team.find_by(name: "Grandma Ain't No Floozy").update(starting_elo: 997)
    Team.find_by(name: 'Shuffle Birds').update(starting_elo: 1041)
    Team.find_by(name: 'Shuffleboard Jones').update(starting_elo: 1017)
    Team.find_by(name: 'Shufflepuff').update(starting_elo: 1017)
    Team.find_by(name: 'The Cupid Shufflers').update(starting_elo: 973)
    Team.find_by(name: '31crew').update(starting_elo: 973)
    Team.find_by(name: 'Disky Business').update(starting_elo: 1017)
    Team.find_by(name: 'Gucci Tang, Gucci Tang, Gucci Tang').update(starting_elo: 1017)
    Team.find_by(name: 'Shuffleupagus').update(starting_elo: 1062)
    Team.find_by(name: 'Hammered Hammers').update(starting_elo: 997)
    Team.find_by(name: 'Big Baller Biscuits').update(starting_elo: 973)
    Team.find_by(name: 'Nothing but 10s').update(starting_elo: 973)
    Team.find_by(name: 'Pun-free Shuffling').update(starting_elo: 973)
    Team.find_by(name: 'Seven Dwarves').update(starting_elo: 973)
    Team.find_by(name: 'Shuffle Now or Puck Later').update(starting_elo: 951)
    Team.find_by(name: 'The Hip Replacements').update(starting_elo: 973)
    Team.find_by(name: 'The Homer').update(starting_elo: 931)
    Team.find_by(name: 'The Tangge-Uppes').update(starting_elo: 1062)
    Team.find_by(name: 'Boca Breeze').update(starting_elo: 973)
    Team.find_by(name: 'Mr. Dr. Nut').update(starting_elo: 1041)
    Team.find_by(name: 'Nothing But Pepp').update(starting_elo: 997)
    Team.find_by(name: 'Shuff It, Shuff It Real Good!').update(starting_elo: 1017)
    Team.find_by(name: 'Shuffle Butter').update(starting_elo: 997)
    Team.find_by(name: 'Shuffleboard of Directors').update(starting_elo: 1017)
    Team.find_by(name: 'Slippery Biscuits').update(starting_elo: 1062)
    Team.find_by(name: 'The Chicago Butts').update(starting_elo: 997)
    Team.find_by(name: 'Tu-Tang Clan').update(starting_elo: 1041)
    Team.find_by(name: 'Bougie Biscuit Boozers').update(starting_elo: 1017)
    Team.find_by(name: 'Clawed Monets').update(starting_elo: 973)
    Team.find_by(name: 'Get Rich or Die Shufflin').update(starting_elo: 1041)
    Team.find_by(name: 'New Tang Clan').update(starting_elo: 1041)
    Team.find_by(name: 'Big Disc Energy').update(starting_elo: 951)
    Team.find_by(name: 'We Thought This Was Curling').update(starting_elo: 997)
    Team.find_by(name: 'A and N Mortgage Shuffle').update(starting_elo: 909)
    Team.find_by(name: 'Concrete Curlers').update(starting_elo: 997)
    Team.find_by(name: 'Super Bro Shufflers').update(starting_elo: 931)
    Team.find_by(name: 'Survey Says').update(starting_elo: 931)
    Team.find_by(name: 'Tang It!').update(starting_elo: 997)
    Team.find_by(name: 'VSOP').update(starting_elo: 973)
    Team.find_by(name: 'Curling Wannabees').update(starting_elo: 973)
    Team.find_by(name: "Nuthin' But A G Tang").update(starting_elo: 951)
    Team.find_by(name: 'Flamingo Fliers').update(starting_elo: 997)
    Team.find_by(name: 'Orca Sliders').update(starting_elo: 1041)
    Team.find_by(name: 'Shuffle Butter (spring-only)').update(starting_elo: 1017)
    Team.find_by(name: 'Shuffshank Redemption').update(starting_elo: 973)
    Team.find_by(name: 'Summer Shufflerz').update(starting_elo: 1062)
    Team.find_by(name: "Team Bell's Beer").update(starting_elo: 1017)
    Team.find_by(name: 'The Eggplants').update(starting_elo: 997)
    Team.find_by(name: 'Hammer Time').update(starting_elo: 931)
    Team.find_by(name: 'Stick Party').update(starting_elo: 997)
    Team.find_by(name: 'Air Biscuit').update(starting_elo: 951)
    Team.find_by(name: 'Bacardi Party').update(starting_elo: 973)
    Team.find_by(name: 'Flashdance').update(starting_elo: 909)
    Team.find_by(name: "Hangin' Tang").update(starting_elo: 973)
    Team.find_by(name: 'Miami Curling Club').update(starting_elo: 1017)
    Team.find_by(name: 'The Squirming Coil').update(starting_elo: 973)
    Team.find_by(name: 'Tropical Bros').update(starting_elo: 1041)
    Team.find_by(name: 'All Day I Dream About Shuffling').update(starting_elo: 1017)
    Team.find_by(name: 'Biscuit Boiz').update(starting_elo: 1017)
    Team.find_by(name: 'Chi Town Shufflers').update(starting_elo: 951)
    Team.find_by(name: 'Guido and the Biscott Bunch').update(starting_elo: 997)
    Team.find_by(name: 'Limp Biscuits').update(starting_elo: 1017)
    Team.find_by(name: 'Nunya Biscuits').update(starting_elo: 973)
    Team.find_by(name: 'Sponsored by Lemmings').update(starting_elo: 1017)
    Team.find_by(name: 'Tang Bang').update(starting_elo: 1062)
    Team.find_by(name: 'The TangaROOS').update(starting_elo: 1041)
    Team.find_by(name: 'Truffle Shuffle').update(starting_elo: 1062)
    Team.find_by(name: "Bag O' Disks").update(starting_elo: 931)
    Team.find_by(name: "Fat Lil' Girls").update(starting_elo: 931)
    Team.find_by(name: 'Handynasty').update(starting_elo: 1041)
    Team.find_by(name: 'Hot Stuff and the Brady Bunch').update(starting_elo: 951)
    Team.find_by(name: 'Lost in the Shuffle').update(starting_elo: 997)
    Team.find_by(name: 'Midwest Opeas').update(starting_elo: 931)
    Team.find_by(name: 'Shuffle Me Timbers').update(starting_elo: 973)
    Team.find_by(name: 'Team Avon').update(starting_elo: 1041)
    Team.find_by(name: 'All Your Biscuit Are Belong To Us').update(starting_elo: 1017)
    Team.find_by(name: 'Cocktails & Dreams').update(starting_elo: 1062)
    Team.find_by(name: 'Gutter Punks').update(starting_elo: 951)
    Team.find_by(name: 'Itstimeforyourkiss').update(starting_elo: 1062)
    Team.find_by(name: 'Resting Biscuit Face').update(starting_elo: 1041)
    Team.find_by(name: 'Strictly Biscuits').update(starting_elo: 1062)
    Team.find_by(name: 'Tang You For Being A Friend').update(starting_elo: 973)
    Team.find_by(name: 'The Shuffle Kerfuffle').update(starting_elo: 1017)
    Team.find_by(name: 'IV Leaguers').update(starting_elo: 951)
    Team.find_by(name: "No Sleep 'til Boca").update(starting_elo: 973)
    Team.find_by(name: 'Super Board Shuffle').update(starting_elo: 1017)
    Team.find_by(name: '4EG Shufflers').update(starting_elo: 951)
    Team.find_by(name: 'Dog Biscuits').update(starting_elo: 997)
    Team.find_by(name: 'Riskit 4 the Biscuit').update(starting_elo: 951)
    Team.find_by(name: 'Son of a Biscuit').update(starting_elo: 931)
    Team.find_by(name: 'Tangled Up In Blue').update(starting_elo: 1017)
    Team.find_by(name: 'The Bad Apples').update(starting_elo: 931)
    Team.find_by(name: 'The Grundles').update(starting_elo: 1017)
    Team.find_by(name: 'Too Legit 2 Biscuit').update(starting_elo: 931)
  end

  desc 'Add Summer Playoffs'
  task summer_playoffs: :environment do
    comment = 'Summer Playoffs - Group Play'

    # Group Play A
    first_match_time = Time.find_zone('America/Chicago').parse('2018-08-26 13:00')
    location = 'Court 01'

    Match.create!(
      time: first_match_time,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Fashion Police'),
      home_team: Team.find_by(name: 'Shuff It, Shuff It Real Good!'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: first_match_time + 20.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Resting Biscuit Face'),
      home_team: Team.find_by(name: 'All Day I Dream About Shuffling'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 40.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Fashion Police'),
      home_team: Team.find_by(name: 'All Day I Dream About Shuffling'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 60.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Resting Biscuit Face'),
      home_team: Team.find_by(name: 'Shuff It, Shuff It Real Good!'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: first_match_time + 80.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Fashion Police'),
      home_team: Team.find_by(name: 'Resting Biscuit Face'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 100.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'All Day I Dream About Shuffling'),
      home_team: Team.find_by(name: 'Shuff It, Shuff It Real Good!'),
      away_score: 0,
      home_score: 1
    )

    # Group Play B
    first_match_time = Time.find_zone('America/Chicago').parse('2018-08-26 13:00')
    location = 'Court 02'

    Match.create!(
      time: first_match_time,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Mr. Dr. Nut'),
      home_team: Team.find_by(name: 'Tang You For Being A Friend'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 20.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Biscuit Boiz'),
      home_team: Team.find_by(name: 'Whiskey Tang Foxtrot'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: first_match_time + 40.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Mr. Dr. Nut'),
      home_team: Team.find_by(name: 'Whiskey Tang Foxtrot'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 60.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Biscuit Boiz'),
      home_team: Team.find_by(name: 'Tang You For Being A Friend'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: first_match_time + 80.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Mr. Dr. Nut'),
      home_team: Team.find_by(name: 'Biscuit Boiz'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 100.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Whiskey Tang Foxtrot'),
      home_team: Team.find_by(name: 'Tang You For Being A Friend'),
      away_score: 0,
      home_score: 1
    )

    # Group Play C
    first_match_time = Time.find_zone('America/Chicago').parse('2018-08-26 13:00')
    location = 'Court 03'

    Match.create!(
      time: first_match_time,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Get Rich or Die Shufflin'),
      home_team: Team.find_by(name: 'Boca Breeze'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 20.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Tang Bang'),
      home_team: Team.find_by(name: 'Swift Biscuits'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 40.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Get Rich or Die Shufflin'),
      home_team: Team.find_by(name: 'Swift Biscuits'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: first_match_time + 60.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Tang Bang'),
      home_team: Team.find_by(name: 'Boca Breeze'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 80.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Get Rich or Die Shufflin'),
      home_team: Team.find_by(name: 'Tang Bang'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 100.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Swift Biscuits'),
      home_team: Team.find_by(name: 'Boca Breeze'),
      away_score: 0,
      home_score: 1
    )

    # Group Play D
    first_match_time = Time.find_zone('America/Chicago').parse('2018-08-26 13:00')
    location = 'Court 04'

    Match.create!(
      time: first_match_time,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Biscuit Buddies'),
      home_team: Team.find_by(name: 'Honey, Butter My Biscuit'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: first_match_time + 20.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Team Bell\'s Beer'),
      home_team: Team.find_by(name: 'Strictly Biscuits'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 40.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Biscuit Buddies'),
      home_team: Team.find_by(name: 'Strictly Biscuits'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 60.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Team Bell\'s Beer'),
      home_team: Team.find_by(name: 'Honey, Butter My Biscuit'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: first_match_time + 80.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Biscuit Buddies'),
      home_team: Team.find_by(name: 'Team Bell\'s Beer'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 100.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Strictly Biscuits'),
      home_team: Team.find_by(name: 'Honey, Butter My Biscuit'),
      away_score: 1,
      home_score: 0
    )

    # Group Play E
    first_match_time = Time.find_zone('America/Chicago').parse('2018-08-26 13:00')
    location = 'Court 07'

    Match.create!(
      time: first_match_time,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Orca Sliders'),
      home_team: Team.find_by(name: 'Truffle Shuffle'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 20.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Butter Yo Biscuit'),
      home_team: Team.find_by(name: 'The Cupid Shufflers'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: first_match_time + 40.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Orca Sliders'),
      home_team: Team.find_by(name: 'The Cupid Shufflers'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 60.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Butter Yo Biscuit'),
      home_team: Team.find_by(name: 'Truffle Shuffle'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 80.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Orca Sliders'),
      home_team: Team.find_by(name: 'Butter Yo Biscuit'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 100.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'The Cupid Shufflers'),
      home_team: Team.find_by(name: 'Truffle Shuffle'),
      away_score: 1,
      home_score: 0
    )

    # Group Play F
    first_match_time = Time.find_zone('America/Chicago').parse('2018-08-26 13:00')
    location = 'Court 08'

    Match.create!(
      time: first_match_time,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Grandma Ain\'t No Floozy'),
      home_team: Team.find_by(name: 'Summer Shufflerz'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: first_match_time + 20.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'The Chicago Butts'),
      home_team: Team.find_by(name: 'Shufflepuff'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: first_match_time + 40.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Grandma Ain\'t No Floozy'),
      home_team: Team.find_by(name: 'Shufflepuff'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: first_match_time + 60.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'The Chicago Butts'),
      home_team: Team.find_by(name: 'Summer Shufflerz'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: first_match_time + 80.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Grandma Ain\'t No Floozy'),
      home_team: Team.find_by(name: 'The Chicago Butts'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: first_match_time + 100.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Shufflepuff'),
      home_team: Team.find_by(name: 'Summer Shufflerz'),
      away_score: 0,
      home_score: 1
    )

    # Group Play G
    first_match_time = Time.find_zone('America/Chicago').parse('2018-08-26 13:00')
    location = 'Court 09'

    Match.create!(
      time: first_match_time,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Itstimeforyourkiss'),
      home_team: Team.find_by(name: 'Highway to the Tanger Zone'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 20.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Slippery Biscuits'),
      home_team: Team.find_by(name: 'Binnies Biscuits'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: first_match_time + 40.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Itstimeforyourkiss'),
      home_team: Team.find_by(name: 'Binnies Biscuits'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: first_match_time + 60.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Slippery Biscuits'),
      home_team: Team.find_by(name: 'Highway to the Tanger Zone'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 80.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Itstimeforyourkiss'),
      home_team: Team.find_by(name: 'Slippery Biscuits'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: first_match_time + 100.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Binnies Biscuits'),
      home_team: Team.find_by(name: 'Highway to the Tanger Zone'),
      away_score: 1,
      home_score: 0
    )

    # Group Play H
    first_match_time = Time.find_zone('America/Chicago').parse('2018-08-26 13:00')
    location = 'Court 10'

    Match.create!(
      time: first_match_time,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Curling Wannabees'),
      home_team: Team.find_by(name: 'Fancy Pants'),
      away_score: 0,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 20.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'DDIR'),
      home_team: Team.find_by(name: 'Shuffleboard of Directors'),
      away_score: 0,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 20.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Curling Wannabees'),
      home_team: Team.find_by(name: 'Shuffleboard of Directors'),
      away_score: 0,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 20.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'DDIR'),
      home_team: Team.find_by(name: 'Fancy Pants'),
      away_score: 0,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 20.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Curling Wannabees'),
      home_team: Team.find_by(name: 'DDIR'),
      away_score: 0,
      home_score: 0
    )

    Match.create!(
      time: first_match_time + 20.minutes,
      location: location,
      comment: comment,
      away_team: Team.find_by(name: 'Shuffleboard of Directors'),
      home_team: Team.find_by(name: 'Fancy Pants'),
      away_score: 0,
      home_score: 0
    )

    # Round of 16
    comment = 'Summer Playoffs - Round of 16'
    match_time = Time.find_zone('America/Chicago').parse('2018-08-26 15:30')

    Match.create!(
      time: match_time,
      location: 'Court 01',
      comment: comment,
      away_team: Team.find_by(name: 'Orca Sliders'),
      home_team: Team.find_by(name: 'Biscuit Buddies'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: match_time,
      location: 'Court 02',
      comment: comment,
      away_team: Team.find_by(name: 'Summer Shufflerz'),
      home_team: Team.find_by(name: 'Tang Bang'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: match_time,
      location: 'Court 03',
      comment: comment,
      away_team: Team.find_by(name: 'Binnies Biscuits'),
      home_team: Team.find_by(name: 'Tang You For Being A Friend'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: match_time,
      location: 'Court 04',
      comment: comment,
      away_team: Team.find_by(name: 'Shuffleboard of Directors'),
      home_team: Team.find_by(name: 'Fashion Police'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: match_time,
      location: 'Court 07',
      comment: comment,
      away_team: Team.find_by(name: 'Honey, Butter My Biscuit'),
      home_team: Team.find_by(name: 'Curling Wannabees'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: match_time,
      location: 'Court 08',
      comment: comment,
      away_team: Team.find_by(name: 'Get Rich or Die Shufflin'),
      home_team: Team.find_by(name: 'Slippery Biscuits'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: match_time,
      location: 'Court 09',
      comment: comment,
      away_team: Team.find_by(name: 'Mr. Dr. Nut'),
      home_team: Team.find_by(name: 'Shufflepuff'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: match_time,
      location: 'Court 10',
      comment: comment,
      away_team: Team.find_by(name: 'Shuff It, Shuff It Real Good!'),
      home_team: Team.find_by(name: 'The Cupid Shufflers'),
      away_score: 1,
      home_score: 0
    )

    # Round of 8
    comment = 'Summer Playoffs - Round of 8'
    match_time = Time.find_zone('America/Chicago').parse('2018-08-26 16:30')

    Match.create!(
      time: match_time,
      location: 'Court 01',
      comment: comment,
      away_team: Team.find_by(name: 'Tang You For Being A Friend'),
      home_team: Team.find_by(name: 'Shuffleboard of Directors'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: match_time,
      location: 'Court 02',
      comment: comment,
      away_team: Team.find_by(name: 'Get Rich or Die Shufflin'),
      home_team: Team.find_by(name: 'Curling Wannabees'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: match_time,
      location: 'Court 03',
      comment: comment,
      away_team: Team.find_by(name: 'Orca Sliders'),
      home_team: Team.find_by(name: 'Summer Shufflerz'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: match_time,
      location: 'Court 04',
      comment: comment,
      away_team: Team.find_by(name: 'Shuff It, Shuff It Real Good!'),
      home_team: Team.find_by(name: 'Shufflepuff'),
      away_score: 0,
      home_score: 1
    )

    # Semi-Finals
    comment = 'Summer Playoffs - Semi-Finals'
    match_time = Time.find_zone('America/Chicago').parse('2018-08-27 19:00')

    Match.create!(
      time: match_time,
      location: 'Court 01',
      comment: comment,
      away_team: Team.find_by(name: 'Shufflepuff'),
      home_team: Team.find_by(name: 'Get Rich or Die Shufflin'),
      away_score: 1,
      home_score: 0
    )

    Match.create!(
      time: match_time,
      location: 'Court 02',
      comment: comment,
      away_team: Team.find_by(name: 'Summer Shufflerz'),
      home_team: Team.find_by(name: 'Tang You For Being A Friend'),
      away_score: 1,
      home_score: 0
    )

    # Finals
    match_time = Time.find_zone('America/Chicago').parse('2018-08-27 20:00')

    Match.create!(
      time: match_time,
      location: 'Court 01',
      comment: 'Summer Playoffs - 3rd Place Game',
      away_team: Team.find_by(name: 'Get Rich or Die Shufflin'),
      home_team: Team.find_by(name: 'Tang You For Being A Friend'),
      away_score: 0,
      home_score: 1
    )

    Match.create!(
      time: match_time,
      location: 'Court 02',
      comment: 'Summer Playoffs - Finals',
      away_team: Team.find_by(name: 'Shufflepuff'),
      home_team: Team.find_by(name: 'Summer Shufflerz'),
      away_score: 1,
      home_score: 0
    )
  end

  desc 'Add Starting Match Counts to Spring teams'
  task starting_match_count: :environment do
    Team.where.not(starting_elo: nil).update_all(starting_match_count: 8)
  end
end
