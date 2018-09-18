%w(teams summer_monday_hammer).each do |seed|
  load File.join(Rails.root, 'db', 'seeds', "#{seed}.rb")
end
