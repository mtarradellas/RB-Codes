require_relative 'Figure.rb'

class Rectangle < Figure
	attr_reader :a, :b, :c, :d
	def initialize (a, c)
		raise 'Points in same axis' if a.x == c.x || a.y == c.y
		@a = a
		@b = Point.new(a.x, c.y)
		@c = c
		@d = Point.new(c.x, a.y)
	end

	def perimeter
		a.distance(b) + b.distance(c) + c.distance(d) + d.distance(a)
	end

	def area
		a.distance(b) * b.distance(c)
	end

	def base
		a.distance(d)
	end

	def hight
		a.distance(b)
	end

	def belongs(point)
		if (!a.betweenY(b, point) && !a.betweenX(d, point) && !b.betweenX(c, point) && !d.betweenY(c, point)) 
			puts "Point does not belong to figure's frontier"
		else puts "Points belongs to the figure's frontier"		
		end
	end

	def move_up(delta)
		@a.move_up delta
		@b.move_up delta
		@c.move_up delta
		@d.move_up delta
	end

	def ==(other)
		raise 'Invalid Parameter' unless other.is_a?(Rectangle)
		@a == other.a && @c == other.c
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
		"Rectangle A = " + a.to_s + ", B = " + b.to_s + ", C = " + c.to_s + ", D = " + d.to_s
	end

	def <=>(other)
		self.area <=> other.area
	end
end