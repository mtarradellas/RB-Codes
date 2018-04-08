# class CompositeFunction

# 	def initialize(f, g)
# 		@f = f
# 		@g = g	
# 	end

# 	def evaluate(x)
# 		f.evaluate (g.evaluate x)
# 	end
# end

class LinearFunction

	def initialize(a, b)
		@a = a
		@b = b
	end

	# def evaluate(x)
	# 	@a * x + @b		
	# end
end

# class QuadraticFunction
# 	def initialize(a, b, c)
# 		@a = a
# 		@b = b
# 		@c = c
# 	end

# 	def evaluate(x)
# 		@a * x**2 + @b * x + @c
# 	end
# end

f1 = LinearFunction.new(2,0)
f2 = QuadraticFunction.new(1, 0, 0)
# f3 = CompositeFunction.new (f1, f2)
puts f3.evaluate 5