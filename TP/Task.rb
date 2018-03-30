class Task
	attr_reader :due_date, :id, :group_name
	def initialize(task_name, id, due_date, group_name)
		@name = task_name
		@due_date = due_date
		@group_name = group_name
		@completed = false
		@id = id
	end

	def complete
		@completed = true
	end

	def <=>(other)
		if @due_date.nil?
			return @id <=> other.id if other.due_date.nil?
			return -1
		end 
		return @due_date <=> other.due_date unless other.due_date.nil?
		return 1 
	end
end

