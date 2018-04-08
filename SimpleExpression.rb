class SimpleExpression
	attr_writer :value

	def initialize(value)
		@value = value
	end

	def evaluate
		@value
	end

	def and(exp)
		AndExpression.new(self, exp)
	end

	def or(exp)
		OrExpression.new(self, exp)
	end

	def not
		NotExpression.new(self)
	end
end


class AndExpression < SimpleExpression

	def initialize(exp1, exp2)
		@exp1 = exp1
		@exp2 = exp2
	end

	def evaluate
		@exp1.evaluate && @exp2.evaluate
	end

end

class OrExpression < SimpleExpression

	def initialize(exp1, exp2)
		@exp1 = exp1
		@exp2 = exp2
	end

	def evaluate
		@exp1.evaluate || @exp2.evaluate
	end

end

class NotExpression < SimpleExpression

	def initialize(exp1)
		@exp1 = exp1
	end

	def evaluate
		!@exp1.evaluate
	end

end


exp1 = SimpleExpression.new(true)
exp2 = SimpleExpression.new(false)	
exp3 = exp1.not
exp4 = exp1.or(exp2)
exp5 = exp3.and(exp4)

puts exp1.evaluate
puts exp2.evaluate
puts exp3.evaluate
puts exp4.evaluate
puts exp5.evaluate
puts "\n"
exp1.value = false

puts exp1.evaluate
puts exp2.evaluate
puts exp3.evaluate
puts exp4.evaluate
puts exp5.evaluate