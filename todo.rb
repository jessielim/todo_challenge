# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'

# Your Code begins from this line onwards #

command = ARGV[0]
val_id = ARGV[1]
val_desc = ARGV[2]
val_stat = ARGV[3]
case command

	when "--add"
		if val_id == nil
			puts "If you don't feed me, I won't perform well. Sorry, please try again."
			system "clear"
		else
			Task.add
			puts "A new task has been added!"
			puts "Run --list to view."
		end
	when "--list"
		Task.list
	when "--update"
		Task.update(val_id, val_desc, val_stat)
	when "--remove"
		Task.remove(val_id)

end