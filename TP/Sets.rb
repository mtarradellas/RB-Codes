require_relative 'GroupsHash.rb'
require 'set'
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

	def add_completed(task)
		@completed_set << task
	end

	def archive
		@all_set.each{|i| @all_set.delete(i) if i.completed == 'X'}
		@completed_set.each{|i| @completed_set.delete(i)}
		@groups_hash.archive
	end
end