while (command = gets.chomp)!= "exit"
	command_manager = Commands.new(command)
	command_manager.obtain_comand
	command

----------------------------------------------
	if comando.start_with? "add "
		comando = comando[4..-1]

		if comando.start_with? "+"
			group_end = group.index(" ")
			raise Invalid Group if group_end == 1
			group = comando[1..group_end]
			comando = comando[group_end..-1]
		end
		

		if due = comando.index(" due ")
			puts comando[4..due]
			puts comando[due+5..-1]
		end
	end
	if comando.start_with?("list")
		if comando=="list"
			list all
		elsif comando[5..-1]=="group"
			list group
		elsif comando[5]=="+"
			list comando[6..-1]
	end
end

