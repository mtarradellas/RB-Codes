class Group
	attr_reader :group_name
	def initialize(group_name)
		@group_name = group_name
		@tasks = SortedSet.new
	end

	def add(task)
		@tasks << task
	end

end
