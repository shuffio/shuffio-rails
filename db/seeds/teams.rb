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
t = Team.create!(name: 'Back That Tang Up', captain: 'Kristin Cerutti')
t.divisions << divisions[:spring][:mp]
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Bad News Biscuits', captain: 'Robin Russo')
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Biscuits and Lazy', captain: 'Ben Packard')
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Butter Yo Biscuit', captain: 'Christina Brown')
t.divisions << divisions[:spring][:mp]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Future Snowbirds', captain: 'Amanda Braslow')
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Honey, Butter My Biscuit', captain: 'Freddy Calixto')
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Hottie Biscotti', captain: 'Allyson Feierberg')
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'MadCap Shuffle', captain: 'Anthony Marsala')
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'mHUBians', captain: 'Quinn Campbell')
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Pucks Run Amuck', captain: 'John Adler')
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Shuffy The Vampire Slayer', captain: 'Jessica Marshall')
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Sponge Worthy', captain: 'Christy Gregory')
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Tang On The Drum All Day', captain: 'Andrew Larsen')
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: "Tang's For the Memories", captain: 'Chris Noonan')
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'The Puck Stops Here', captain: '?')
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'The Shuffleupagusses', captain: 'Kate McManus')
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Whiskey Tang Foxtrot', captain: 'Jim Seesel')
t.divisions << divisions[:spring][:mp]
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Aloysius Shuffleupagus', captain: 'Ben Block')
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'Astronaut Juice', captain: 'John Reavey', former_names: 'Tangbang')
t.divisions << divisions[:spring][:mp]
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Binnies Biscuits', captain: 'Andrew Riebe')
t.divisions << divisions[:spring][:mp]
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Dad Bods Aboard', captain: 'Rachel Filus')
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'Fashion Police', captain: 'Jordan Alvarez')
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'Murderburgers 2.0', captain: 'Adam Thurston', former_names: 'The Murder Burgers')
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'Pack of Strays', captain: 'Andrew Tader')
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'RecruiTang', captain: 'Allison Leverenz')
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'Risky Biscuits', captain: 'Annie Barry')
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'Send Us Your Disk Pics', captain: 'Kristin Tanabe')
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'Short & Tangy', captain: 'Jon Klein', former_names: 'Beergeeks')
t.divisions << divisions[:spring][:mp]
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'The Ruffled Horde', captain: 'Alanna Sosenko')
t.divisions << divisions[:summer][:mp]

t = Team.create!(name: 'Cannon Shufflers', captain: 'Aleksandra Furman')
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'Grubhub', captain: 'Meredith Rosenbloom')
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'I Hate Work', captain: 'Katrina Meckes')
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'Nothin\ but a "G" tang', captain: 'Liz Potokar')
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'PBD Shufflers', captain: 'Stacy Gauthier')
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'Shifty Mother Puckers', captain: 'Stephanie Kraiss')
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'Shuffle Puck Up', captain: 'Christy Scoughton')
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'Shuffle State of Mind', captain: 'Jordan Huber')
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: "Skender's Shufflers", captain: 'Neill Malone')
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'W.H.oosier Mama', captain: 'Laura Scallon')
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'Walkers + Pills', captain: 'Matt Zelensek')
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'Wild Tangs', captain: 'Joe Mautino')
t.divisions << divisions[:spring][:mp]

t = Team.create!(name: 'Zero Pucks Given', captain: 'Janeallison Ng')
t.divisions << divisions[:spring][:mp]


# Monday Cherry
t = Team.create!(name: '6151 Richmond St', captain: 'Amber Sauer')
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Ace Shufflers and Robert', captain: 'Leslie von Husen')
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'American Shuffle', captain: 'Jessica Thelen')
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Biscuit Club', captain: 'Marcus Rodriguez', former_names: 'USA Curling Team')
t.divisions << divisions[:spring][:mp]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Del Boca Vista Condo Association', captain: 'Kevin Lada', former_names: 'Bonavista Condo Association')
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Do The Downes Shuffle', captain: 'Elena Frankel')
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Drinkers with a Biscuit Problem', captain: 'Samantha Bankmann')
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Fancy Pants', captain: 'John Summy')
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Golden GILFs', captain: 'Silas Hoxie')
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Grand Pappy and the Shifty Shafts Retirement Home', captain: 'Jason Wyeth')
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: "Grandma Ain't No Floozy", captain: 'Rob Sikkel')
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: "Nymeria's Favorites", captain: 'Amy McFarlane')
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Risk It For The Biscuit', captain: 'Stefan Levay-Young')
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Shuffle Birds', captain: 'Daniel Collado', former_names: 'The Royal Cluster Pucks')
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Shuffleboard Jones', captain: 'Michael Holm', former_names: 'Northside Lee-side Sliders')
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'Shufflepuff', captain: 'Kali Williams')
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'The Cupid Shufflers', captain: 'Adam Schlafhauser', former_names: 'Del Boca Vista All-Stars')
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: "We Don't See Why Not", captain: 'Dave Berman')
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'We Thought This Was Quidditch', captain: 'Bonnie, El Capitan')
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: '31crew', captain: 'Michael Malek')
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]

t = Team.create!(name: 'Biscuit Buddies', captain: 'Corey Taustein')
t.divisions << divisions[:summer][:mc]

t = Team.create!(name: "Breakin' Biscuits", captain: "Brian O'Connell")
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'Cherry Pies', captain: 'Alissa barks')
t.divisions << divisions[:summer][:mc]

t = Team.create!(name: 'Disky Business', captain: 'Caroline Brown')
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]

t = Team.create!(name: 'Gucci Tang, Gucci Tang, Gucci Tang', captain: 'Alisha Phillips')
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Half Acre', captain: 'Gustavo Villatoro')
t.divisions << divisions[:summer][:mc]

t = Team.create!(name: 'Powershuff Girls', captain: 'Alison Suzukamo')
t.divisions << divisions[:summer][:mc]

t = Team.create!(name: 'Shuffleupagus', captain: 'Jeff Seroogy')
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:mc]

t = Team.create!(name: 'Hammered Hammers', captain: 'Matt OBrien')
t.divisions << divisions[:spring][:mc]

t = Team.create!(name: 'Big Baller Biscuits', captain: 'Hanna Anderson', former_names: 'Here for the Beer')
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:tc]

t = Team.create!(name: 'Nothing but 10s', captain: 'Christine Mcpherson')
t.divisions << divisions[:spring][:mc]

t = Team.create!(name: 'Pun-free Shuffling', captain: 'Jake Miner')
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Seven Dwarves', captain: 'Cooper Annenberg')
t.divisions << divisions[:spring][:mc]

t = Team.create!(name: 'Shuffle Now or Puck Later', captain: 'Ross Modjeska')
t.divisions << divisions[:spring][:mc]

t = Team.create!(name: 'The Hip Replacements', captain: 'Lindsay Saewitz')
t.divisions << divisions[:spring][:mc]

t = Team.create!(name: 'The Homer', captain: 'Matthew Summy')
t.divisions << divisions[:spring][:mc]

t = Team.create!(name: 'The Tangge-Uppes', captain: 'Alyssa Russler')
t.divisions << divisions[:spring][:mc]
t.divisions << divisions[:fall][:mp]


# Monday Hammer
t = Team.create!(name: 'Boca Breeze', captain: 'Ian Firestone', former_names: 'Wu Tang Financial')
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Dirty Larz and the Boys', captain: 'Caitlin Kohli')
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Gosh Tang It!', captain: 'Patrick Ragan', former_names: 'Del Boca Breeze')
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Mr. Dr. Nut', captain: 'Tim McLoughlin')
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mc]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Nothing but Pepp', captain: 'Rob OMahoney')
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Off The Rails', captain: 'Laura Keener')
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Quite The Kershuffle', captain: 'Ashley Jacobson')
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Shuff It, Shuff It Real Good!', captain: 'Kevin Reedy')
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Shuffalo Gang', captain: 'Melissa Long')
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Shuffle Butter', captain: 'Kelsey Cunniff')
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Shuffleboard of Directors', captain: 'Kyle Bingham')
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Shufflepuffers', captain: 'Brett Brewer')
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Slippery Biscuits', captain: "Ryan O'Maley")
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Straight Outta Shady Pines', captain: 'David Macey', former_names: 'Shady Pines Shufflers')
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Super Board Shuffle (change?)', captain: 'Ethan Simonds')
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'The Chicago Butts', captain: 'Craig Sutton', former_names: 'The Risky Biscuits')
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'The Hard Sticks', captain: 'Amber Lenstrom')
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Tangy Millies', captain: 'Buddy', former_names: 'Somethin... Also maybe Spring')
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'The Shufflebaes', captain: 'Jennifer Yip')
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Tu-Tang Clan', captain: 'Sophie Milam')
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mh]

t = Team.create!(name: 'Bougie Biscuit Boozers', captain: 'Justin Busby')
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]

t = Team.create!(name: 'Clawed Monets', captain: 'Kate Calkins')
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]

t = Team.create!(name: 'FC Pencils', captain: 'Clayton Pfeiffer')
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Get Rich or Die Shufflin', captain: 'Derek Falk', former_names: 'Everybody Shufflin')
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Motley Crue Tang Clan', captain: 'Nate ONeil')
t.divisions << divisions[:summer][:mh]

t = Team.create!(name: 'New Tang Clan', captain: 'Chris Allen')
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]

t = Team.create!(name: 'Big Disc Energy', captain: 'Alex Howard', former_names: 'Nice Disc, How I Pucked Your Mother')
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Shuffin Tops', captain: 'Sara Geoghegan')
t.divisions << divisions[:summer][:mh]

t = Team.create!(name: 'Stranger Tangs', captain: 'Ryan Beattie')
t.divisions << divisions[:summer][:mh]

t = Team.create!(name: 'Tangy Biscuits', captain: 'Kathleen OConnor')
t.divisions << divisions[:summer][:mh]
t.divisions << divisions[:fall][:mc]

t = Team.create!(name: 'We thought this was curling', captain: 'Kylie Martineau')
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mh]

t = Team.create!(name: 'A and N Mortgage Shuffle', captain: 'Louann Luck')
t.divisions << divisions[:spring][:mh]

t = Team.create!(name: 'Concrete Curlers', captain: 'Ryan Pasiewicz')
t.divisions << divisions[:spring][:mh]

t = Team.create!(name: 'Shuff Riders', captain: 'Daniel Floberg')
t.divisions << divisions[:spring][:mh]

t = Team.create!(name: 'Survey Says', captain: 'Kevin Loftus')
t.divisions << divisions[:spring][:mh]

t = Team.create!(name: 'Tang It!', captain: 'Tom Theiss')
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mp]
t.divisions << divisions[:fall][:mp]

t = Team.create!(name: 'VSOP', captain: 'Simon Le Conservateur Kristak')
t.divisions << divisions[:spring][:mh]
t.divisions << divisions[:summer][:mc]


# Tuesday Pilot
t = Team.create!(name: 'Assisted Living', captain: 'Maxwell Lindell')
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Curling Wannabes', captain: 'Leslie Norgren')
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Excuse My Tang', captain: 'Angela Haleem', former_names: 'Disco Biscuits')
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Flamingo Fliers', captain: 'Anna Binstein')
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Harry Donuts', captain: 'Ryne Crawford')
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Karen from Finance', captain: 'Stefanie Skaggs')
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Orca Sliders', captain: 'Charlie Bromann')
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'SaaSy Shuffle', captain: 'Kevin Kurasch')
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Shia LeShuff', captain: 'Rae Berg')
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'ShufflePuffs', captain: 'Matt Ligurotis', former_names: 'Shuff Shuff Pass')
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Shuffshank Redemption', captain: 'Britt Calvert', former_names: 'Board AF')
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Summer Shufflerz', captain: 'Andy Norton')
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Swift Biscuits', captain: 'Susan Rosero')
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: "Team Bell's Beer", captain: 'Aaron Hultgren')
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'The Biscuit Bangers', captain: 'Adrian Gonzalez', former_names: 'JumpShuffle')
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'The Eggplants', captain: 'Brendan Yoshimoto')
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'The Not Its', captain: 'Alicia Karcher')
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Whalers', captain: 'Daniel Coughlin')
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tp]

t = Team.create!(name: 'Hammer Time', captain: 'Bruce Portis', former_names: 'The Freds and Ethels')
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Highway to the Tanger Zone', captain: 'Sue Stock')
t.divisions << divisions[:summer][:tp]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Six-inch Disks', captain: 'Jack Lowey')
t.divisions << divisions[:summer][:tp]

t = Team.create!(name: 'Stick Party', captain: 'Kelsey Gilbert-Kreiling')
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tp]

t = Team.create!(name: 'Air Biscuit', captain: 'Cheri Byrd')
t.divisions << divisions[:spring][:tp]

t = Team.create!(name: 'Bacardi Party', captain: 'Chuck Polette')
t.divisions << divisions[:spring][:tp]

t = Team.create!(name: 'Excuse My Tang', captain: 'Riley Carrier')
t.divisions << divisions[:spring][:tp]

t = Team.create!(name: 'Flashdance', captain: 'John Martin')
t.divisions << divisions[:spring][:tp]

t = Team.create!(name: "Hangin' Tang", captain: 'Brett Swanson')
t.divisions << divisions[:spring][:tp]
t.divisions << divisions[:summer][:tc]

t = Team.create!(name: 'Miami Curling Club', captain: 'Jon Werderits')
t.divisions << divisions[:spring][:tp]

t = Team.create!(name: 'The Squirming Coil', captain: 'Robert Pirrello')
t.divisions << divisions[:spring][:tp]

t = Team.create!(name: 'Tropical Bros', captain: 'Megan Maslanka')
t.divisions << divisions[:spring][:tp]


# Tuesday Cherry
t = Team.create!(name: 'All Day I Dream About Shuffling', captain: 'Josh Mandell', former_names: 'Super Bowl Shuffle')
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Biscuit Boiz', captain: 'Patrick Labadie')
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Boardinary People', captain: 'Kaitlin Walsh')
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Chi Town Shufflers', captain: 'Jilly Fish')
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Club Moist', captain: 'Paul Zunkel')
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Guido and the Biscott Bunch', captain: 'Guido Lima', former_names: 'The Ez Pug Shufflers')
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'I thought this was curling', captain: 'Jonathan Clarke')
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Limp Biscuits', captain: 'Ellen Ross')
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Nunya Biscuits', captain: 'Devin MacDonald')
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Shuffalumps & Woozles', captain: 'Kelsey Shaw')
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Sponsored by Lemmings', captain: 'Rachel Goetz', former_names: 'Shame Latrine')
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Summer of Jim', captain: 'James Maletich')
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Tang Bang', captain: 'Brian Sheehan')
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Tangers & Bangers', captain: 'Michael McCarthy', former_names: 'Boujee Babeez')
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'The TangaROOS', captain: 'Melissa Zorio')
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Truffle Shuffle', captain: 'Doug Moring')
t.divisions << divisions[:spring][:tc]
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'We Be Shufflin', captain: 'Amy Costello')
t.divisions << divisions[:fall][:tc]

t = Team.create!(name: 'Fresh out of the Kitchen', captain: 'Joselito Tagarao', former_names: "I've Shuffled and Can't Get Up")
t.divisions << divisions[:summer][:tc]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: "Bag O' Disks", captain: 'Chad Nevitt')
t.divisions << divisions[:spring][:tc]

t = Team.create!(name: "Fat Lil' Girls", captain: 'Parker Sperry')
t.divisions << divisions[:spring][:tc]

t = Team.create!(name: 'Handynasty', captain: 'Alexander Valvassori')
t.divisions << divisions[:spring][:tc]

t = Team.create!(name: 'Hot Stuff and the Brady Bunch', captain: 'Caroline Robbins')
t.divisions << divisions[:spring][:tc]

t = Team.create!(name: 'Lost in the Shuffle', captain: 'Valerie Shuping')
t.divisions << divisions[:spring][:tc]

t = Team.create!(name: 'Midwest Opeas', captain: 'Eliora Jares')
t.divisions << divisions[:spring][:tc]

t = Team.create!(name: 'Shuffle Me Timbers', captain: 'Cameron Crews')
t.divisions << divisions[:spring][:tc]

t = Team.create!(name: 'Team Avon', captain: 'Andrew Holzman')
t.divisions << divisions[:spring][:tc]


# Tuesday Hammer
t = Team.create!(name: 'All Your Biscuit Are Belong To Us', captain: 'David Swallow', former_names: 'Goonies')
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Cocktails & Dreams', captain: 'Erin Disselhorst', former_names: 'Chi City Shufflers')
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'DDIR', captain: 'David McCracken')
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Free Agent Team', captain: '')
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Gutter Punks', captain: 'Benjamin Johnson')
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'ICU Shfflin', captain: 'Kimberly Taylor')
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Itstimeforyourkiss', captain: 'Chris Sodac')
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Lost in the Shuffle', captain: 'Neleigh Wittig')
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Resting Biscuit Face', captain: 'Carrie Leigh')
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Risky Biscuits', captain: 'Kathy Lucas')
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Space Force', captain: 'Abby Andrick')
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Strictly Biscuits', captain: 'Elias Correa')
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Tang You For Being A Friend', captain: 'Ashly Powley')
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'The Shuffle Kerfuffle', captain: 'Luke Wesolowski')
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Trivia Night Was Full', captain: 'Chris Nicolau')
t.divisions << divisions[:fall][:th]

t = Team.create!(name: 'Glimp Bizkits', captain: 'Matthew Wiegel')
t.divisions << divisions[:summer][:th]

t = Team.create!(name: 'IV Leaguers', captain: 'Marissa Hackett')
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]

t = Team.create!(name: 'Mr. Biscuit and the Cabana Boys', captain: 'Mike Hofferth')
t.divisions << divisions[:summer][:th]

t = Team.create!(name: 'Must Tang Sally', captain: 'Jill Florence')
t.divisions << divisions[:summer][:th]

t = Team.create!(name: "No Sleep 'til Boca'", captain: 'Jake Mills')
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]

t = Team.create!(name: 'Schlep', captain: 'John Godwin')
t.divisions << divisions[:summer][:th]

t = Team.create!(name: 'Super Board Shuffle', captain: 'Jennifer Baumann')
t.divisions << divisions[:spring][:th]
t.divisions << divisions[:summer][:th]

t = Team.create!(name: 'Synammon Biscuits', captain: 'Sebastian Andrade')
t.divisions << divisions[:summer][:th]

t = Team.create!(name: 'Unruffle 4 Shuffle', captain: 'Charlotte Lescroart')
t.divisions << divisions[:summer][:th]

t = Team.create!(name: '4EG Shufflers', captain: 'Ryan Gac')
t.divisions << divisions[:spring][:th]

t = Team.create!(name: 'Dog Biscuits', captain: 'Pam Gordon')
t.divisions << divisions[:spring][:th]

t = Team.create!(name: 'Riskit 4 the Biscuit', captain: 'August Bell')
t.divisions << divisions[:spring][:th]

t = Team.create!(name: 'Son of a Biscuit', captain: 'Mark Wills')
t.divisions << divisions[:spring][:th]

t = Team.create!(name: 'Tangled Up In Blue', captain: 'Boca Boehmer')
t.divisions << divisions[:spring][:th]

t = Team.create!(name: 'The Bad Apples', captain: 'Danielle Goodman')
t.divisions << divisions[:spring][:th]

t = Team.create!(name: 'The Grundles', captain: 'Andrew Walker')
t.divisions << divisions[:spring][:th]

t = Team.create!(name: 'Too Legit 2 Biscuit', captain: 'Brian Culp')
t.divisions << divisions[:spring][:th]
