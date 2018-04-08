require_relative 'Figure.rb'

class Ellipse < Figure
	attr_reader :a, :b, :center, :xRadius, :yRadius

	def initialize(a, b)
		raise "Invalid points" if a.x >= b.x || a.y >= b.y
		@xRadius = b.x - a.x
		@yRadius = b.y - a.y
		@center = Point.new(b.x, a.y)
	end

	def area
		PI * @xRadius * @yRadius
	end

	def perimeter
		h = ((@xRadius - yRadius)**2) / ((@xRadius + @yRadius)**2)
		PI*(@xRadius+@yRadius)*(1+ ((3*h) / (10 + Math.sqrt(4-(3*h)))))		
	end

	def move_up(delta)
		@center.move_up delta
	end

	def ==(other)
		raise 'Invalid Parameter' unless other.is_a?(Ellipse)
		@a == other.a && @b == other.b
	end

	def eql?(other)
		self.== other
	end

	def hash
		[@a, @b, @c, @d].hash
	end

	def inspect
		self.to_s
	end

	def to_s
		"Ellipse with center " + center.to_s + ", A lenght: #{xRadius}, B lenght: #{yRadius}"
	end

	def <=>(other)
		self.area <=> other.area
	end
end

