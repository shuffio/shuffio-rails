chicago = Location.find_or_create_by(
  name: 'Royal Palms Chicago',
  address_line1: '1750 N Milwaukee Ave',
  address_city: 'Chicago',
  address_state: 'IL',
  address_zip: '60647',
  address_country: 'United States',
  timezone: 'America/Chicago',
  uri: 'https://www.royalpalmschicago.com'
)

brooklyn = Location.find_or_create_by(
  name: 'Royal Palms Brooklyn',
  address_line1: '514 Union St',
  address_city: 'Brooklyn',
  address_state: 'NY',
  address_zip: '11215',
  address_country: 'United States',
  timezone: 'America/New_York',
  uri: 'https://www.royalpalmsbrooklyn.com'
)

stpete = Location.find_or_create_by(
  name: 'St. Petersburg Shuffleboard Club',
  address_line1: '559 Mirror Lake Dr. N.',
  address_city: 'St. Petersburg',
  address_state: 'FL',
  address_zip: '33701',
  address_country: 'United States',
  timezone: 'America/New_York',
  uri: 'https://stpeteshuffle.com'
)

# Create Chicago
10.times do |i|
  Court.find_or_create_by(
    location: chicago,
    # This makes it Court 01 instead of Court 1
    name: "Court #{format('%02d', i + 1)}"
  )
end

Court.find_or_create_by(
  location: chicago,
  name: 'Lido Deck'
)

# Create Brooklyn
10.times do |i|
  Court.find_or_create_by(
    location: brooklyn,
    name: "Court #{format('%02d', i + 1)}"
  )
end

# Create St. Pete
(1..18).each do |i|
  Court.find_or_create_by(
    location: stpete,
    name: "Court #{format('%02d', i)}"
  )
end

(21..28).each do |i|
  Court.find_or_create_by(
    location: stpete,
    name: "Court #{format('%02d', i)}"
  )
end

(45..59).each do |i|
  Court.find_or_create_by(
    location: stpete,
    name: "Court #{format('%02d', i)}"
  )
end

8.times do |i|
  Court.find_or_create_by(
    location: stpete,
    name: "Court T#{i + 1}"
  )
end
