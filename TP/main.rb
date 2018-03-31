require_relative 'TaskManager.rb'
require_relative 'Commands.rb'
task_manager = TaskManager.new
command_manager = Commands.new
while (command = gets.chomp)!= "exit"
	command_manager.analize(command)
	action = command_manager.obtain_command
	case action
	when Commands::ADD
		date = command_manager.obtain_date
		group = command_manager.obtain_group
		task = command_manager.obtain_string
		task_manager.add(task, date, group)
	when Commands::COMPLETE
		id = command_manager.obtain_string.to_i
		task_manager.complete(id)
	when Commands::LIST_ALL
		all_list = task_manager.obtain_all_list
		all_list.each{|i| print "#{i.id}  [#{i.completed}]  #{i.due_date}  #{i.group_name}  #{i.task_name}"}
	# when LIST_GROUPS
	# 	task_manager.list_groups
	# when LIST_A_GROUP
	# 	group = command_manager.obtain_string
	# 	task_manager.list_group(group)
	# when LIST_DATE
	# 	date = command_manager.date
	# 	task_manager.list_date(date)
	when Commands::ARCHIVE
		task_manager.archive
	end
end

