require_relative 'Figure.rb'

class Triangle < Figure
	attr_reader :a, :b, :c

	def initialize(a, b, c)
		@a = a
		@b = b
		@c = c
	end

	def perimeter
		a.distance(b) + b.distance(c) + c.distance(a)
	end

	def area
		@s = perimeter / 2
		Math.sqrt(@s*(@s-a.distance(b))*(@s-b.distance(c))*(@s-c.distance(a)))
	end

	def to_s
		"Triangle A = " + a.to_s + ", B = " + b.to_s + ", C = " + c.to_s
	end

	def ==(other)
		raise 'Invalid Parameter' unless other.is_a?(Triangle)
		@a == other.a && @b == other.b && @c == other.c
	end

	def eql?(other)
		self.== other
	end

	def hash
		[@a, @b, @c].hash
	end

	def inspect
		self.to_s
	end

	def <=>(other)
		self.area <=> other.area
	end
end