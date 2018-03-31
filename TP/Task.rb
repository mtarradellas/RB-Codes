class Task
	attr_reader :due_date, :id, :group_name, :completed, :task_name
	def initialize(task_name, id, due_date, group_name)
		@task_name = task_name
		@due_date = due_date
		@group_name =group_name
		@completed = nil
		@id = id
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