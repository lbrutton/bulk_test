desc "get games from API and add to DB"
task :get_games => :environment do 
	puts "starting task..."
	GetGames.new.perform
	puts "task finished"
end