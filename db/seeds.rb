%w(teams games).each do |seed|
  load File.join(Rails.root, 'db', 'seeds', "#{seed}.rb")
end
