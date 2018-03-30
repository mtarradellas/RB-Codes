class Sets

	def initialize
		@all_set = SortedSet.new
		@completed_set = SortedSet.new
		@groups_hash = GroupsHash.new
	end

	def add(task)
		@all_set << task
		@groups_hash.add(task) unless task.group_name.nil?
	end

	def complete(task)
		@completed_set << task
	end