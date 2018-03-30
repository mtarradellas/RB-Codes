class GroupsHash

	def initialize
		@group_hash = Hash.new
	end

	def add(task)
		if @group_hash.key? task.group_name
			@group_hash[task.group_name].add(task) 
		else 
			@new_group = Group.new(task.group_name)
			@new_group.add(task)
		end
	end