class SimpleExpression
	attr_writer :value

	def initialize(value)
		@value = value
	end

	def evaluate
		@value
	end

	def and(exp)
		SimpleExpression.new(@value && exp.evaluate)

	end

	def or(exp)
		SimpleExpression.new(@value || exp.evaluate)
	end

	def not
		SimpleExpression.new(!@value)
	end
end


class ComplexExpression

	def initialize()
		
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