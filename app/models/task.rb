class Task < ActiveRecord::Base

	def self.add
		tasks = Task.new(description: "#{ARGV[1]}", status: "Undone")
		tasks.save	
	end

	def self.update(val, descpt, stats)
		list = []
		listall = Task.all

		listall.each do |task|
			list << task
		end

		val = val.to_i

		if val <= list.length
			item = list[val-1]
			item.update(description: descpt, status: stats)
			p  "Task have been updated!"
		else
			p "Task number #{val} is not found. Are you sure that this is the right task number?"
		end 
	end

	def self.remove(val)
		list = []
		tests = Task.all
		tests.each do |task| 
			list << task
		end
		val = val.to_i
		if val <= list.length
			item = list[val-1]
			item.delete
			puts "Task #{val} has been deleted."
			puts "=============================="
			puts "---------LIST OF TASKS--------"
			puts "=============================="
			puts "  No.   Description     Status"
			puts "------- ------------    ------"
			Task.all.each_with_index do |task, id|
			puts "Task #{id+1}  #{task.description} [#{task.status}]"
			end
			else 
			p "Task number #{val} is not found. Are you sure that this is the right task number?"
		end
		
	end

	def self.list
			puts "=============================="
			puts "---------LIST OF TASKS--------"
			puts "=============================="
			puts "  No.   Description     Status"
			puts "------- ------------    ------"
			Task.all.each_with_index do |task, id|
			
			puts "Task #{id+1}  #{task.description}	[#{task.status}]"
		end
		
	end
end


