require_relative 'Sets.rb'
class KeOnda
	attr_reader :due_date, :id, :group_name, 

	def initialize(task_name, id, due_date, group_name)
		@task_name = task_name
		@id = id
		@due_date = due_date
		@group_name = group_name
		@completed = nil
	end

	def complete
		@completed = 'X'
	end

	def <=>(other)
		if @due_date.nil?
			return @id <=> other.id if other.due_date.nil?
			return -1
		end 
		return @due_date <=> other.due_date unless other.due_date.nil?
		return 1 
	end

	# def to_s
	# 	"#{@id}\t[#{@completed}]\t#{@due_date.day}\/#{@due_date.month}\/#{@due_date.year}\t#{@}"
	 	
	# end
end


class TaskManager

	def initialize
		@tasks_hash = Hash.new
		@sets = Sets.new
		@id_counter = 0
	end

	def add(task_name, due_date, group_name)
		@id_counter += 1
		task = Tasksss.new(task_name, @id_counter, due_date, group_name)
		@tasks_hash[@id_counter] = task
		@sets.add(@tasks_hash[@id_counter]) 
	end

	def list_all
		nil
	end

	def complete(id)
		raise InvalidID unless @tasks_hash.key? id
		@tasks_hash[id].complete
		@sets.add_completed(@tasks_hash[id])
	end

	def archive
		@sets.archive
	end
end

task_test = KeOnda.new("hola", "porque", "no", "anda")
