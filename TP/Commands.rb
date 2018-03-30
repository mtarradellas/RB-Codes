class Commands

	def initialize(command)
		@string = string
	end

	def obtain_command
		
		if @string.start_with? "add "
			@string = @string[4..-1]
			@command = ADD

		elsif @string.start_with? "list"
			if @string == "list"
				@command = LIST_ALL
			elsif @string[4..-1] == " group"
				@command = LIST_GROUP
			elsif @string[4..5] == " +"
				@string = @string[6..-1]
				@command = LIST_DA_GROUP
			elsif @string[4..-1] == " overdue"
				@command = LIST_OVERDUE
			elsif @string[4..-1] == " due today"
				@command = LIST_TODAY
			elsif @string[4..-1] == " due tomorrow"
				@command = LIST_TOMORROW
			elsif @string[4..-1] == " due this-week"
				@command = LIST_THIS_WEEK
			end

		elsif @string.start_with? "complete "
			@string = @string[9..-1]
			@command = COMPLETE

		elsif @string == "ac"
			@command = ARCHIVE
		end
	end

	def obtain_date
		if idx = @string.index(" due ")
			@date = @string[idx+5..-1]
			@string = @string[0...idx]
	end

	def validate_date
		@date = Date.today if @date == "today"
		@date = Date.today.prev_day if @date == "yesterday"
		@date = Date.today.next_day if @date == "tomorrow"
		raise InvalidDate unless @date.lenght == 10
		raise InvalidDate unless @date[2] == @date[5] == '\\'
		@date.delete! "\\"
		raise InvalidDate unless @date.lenght == 8
		raise InvalidDate unless @date.to_i.digits.count == 8
		year = @date[6..9].to_i
		month = @date[3..4].to_i
		day = @date[0..1].to_i
		raise InvalidDate unless Date.valid_date?(year, month, day)
		@date = Date.new(year, month, day)
	end
end