class Taskinator

	def initialize
		@tasks_hash = Hash.new
		@sets = Sets.new
		@id_counter = 0
	end

	def add(task_name, due_date, group_name)
		@id_counter += 1
		@tasks_hash[@id_counter] = Task.new(task_name, id, due_date, group_name)
		@sets.add(tasks_hash[id_counter]) 
	end

	def :o
			
	end

	def complete(id)
		@tasks_hash[id].complete
		sets.complete(@tasks_hash[id])
	end