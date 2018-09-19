division = Division.find_by(name: "Monday Hammer", season_id: 2)

# Week 1
Match.create!(
  time: Time.find_zone('America/Chicago').parse('2018-06-25 20:30:00'),
  division: division,
  location: 'Court 01',
  away_team: Team.find_by(name: 'Straight Outta Shady Pines'),
  home_team: Team.find_by(name: 'Boca Breeze'),
  away_score: 0,
  home_score: 1
)

Match.create!(
  time: Time.find_zone('America/Chicago').parse('2018-06-25 20:30:00'),
  division: division,
  location: 'Court 02',
  away_team: Team.find_by(name: 'Shuff It, Shuff It Real Good!'),
  home_team: Team.find_by(name: 'Bougie Biscuit Boozers'),
  away_score: 0,
  home_score: 1
)

Match.create!(
  time: Time.find_zone('America/Chicago').parse('2018-06-25 20:30:00'),
  division: division,
  location: 'Court 03',
  away_team: Team.find_by(name: 'Shuffin Tops'),
  home_team: Team.find_by(name: 'Clawed Monets'),
  away_score: 0,
  home_score: 1
)

Match.create!(
  time: Time.find_zone('America/Chicago').parse('2018-06-25 20:30:00'),
  division: division,
  location: 'Court 04',
  away_team: Team.find_by(name: 'Shuffleboard of Directors'),
  home_team: Team.find_by(name: 'Tangy Biscuits'),
  away_score: 1,
  home_score: 0
)

Match.create!(
  time: Time.find_zone('America/Chicago').parse('2018-06-25 20:30:00'),
  division: division,
  location: 'Court 05',
  away_team: Team.find_by(name: 'Shufflepuffers'),
  home_team: Team.find_by(name: 'Get Rich or Die Shufflin'),
  away_score: 0,
  home_score: 1
)

Match.create!(
  time: Time.find_zone('America/Chicago').parse('2018-06-25 20:30:00'),
  division: division,
  location: 'Court 06',
  away_team: Team.find_by(name: 'Slippery Biscuits'),
  home_team: Team.find_by(name: 'Big Disc Energy'),
  away_score: 0,
  home_score: 1
)

Match.create!(
  time: Time.find_zone('America/Chicago').parse('2018-06-25 20:30:00'),
  division: division,
  location: 'Court 07',
  away_team: Team.find_by(name: 'The Chicago Butts'),
  home_team: Team.find_by(name: 'FC Pencils'),
  away_score: 1,
  home_score: 0
)

Match.create!(
  time: Time.find_zone('America/Chicago').parse('2018-06-25 20:30:00'),
  division: division,
  location: 'Court 08',
  away_team: Team.find_by(name: 'Stranger Tangs'),
  home_team: Team.find_by(name: 'Motley Crue Tang Clan'),
  away_score: 1,
  home_score: 0
)

Match.create!(
  time: Time.find_zone('America/Chicago').parse('2018-06-25 20:30:00'),
  division: division,
  location: 'Court 09',
  away_team: Team.find_by(name: 'Tu-Tang Clan'),
  home_team: Team.find_by(name: 'New Tang Clan'),
  away_score: 1,
  home_score: 0
)

Match.create!(
  time: Time.find_zone('America/Chicago').parse('2018-06-25 20:30:00'),
  division: division,
  location: 'Court 10',
  away_team: Team.find_by(name: 'We Thought This Was Curling'),
  home_team: Team.find_by(name: 'Nothing But Pepp'),
  away_score: 0,
  home_score: 1
)
