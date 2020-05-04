conf.echo = false

m8 = Division.find(45)
teams = m8.teams
difficulty = {}
teams.each { |t| difficulty[t.name] = 0 }
matches = m8.setup_matches

pepp = Team.find(84) # away
sponge = Team.find(12) # home
shuff = Team.find(87) # home
tutang = Team.find(99) # away

matches.each do |m|
  puts '#1 Pepp vs Shuff' if m.away_team == pepp && m.home_team == shuff
  puts '#2 Pepp vs Sponge' if m.away_team == pepp && m.home_team == sponge
  puts '#3 Tu-Tang vs Shuff' if m.away_team == tutang && m.home_team == shuff
  puts '#4 Tu-Tang vs Sponge' if m.away_team == tutang && m.home_team == sponge

  difficulty[m.home_team.name] += m.away_team.elo_cache
  difficulty[m.away_team.name] += m.home_team.elo_cache
end

elo_avg = difficulty.values.sum.to_f / difficulty.values.size.to_f

teams.each do |t|
  difference = difficulty[t.name] - elo_avg
  puts "#{t.name}: #{difference}" if difference >= 150 || difference <= -150
end

##### IF GOOD TO GO
matches.each(&:save!)
