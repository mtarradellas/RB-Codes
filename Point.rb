class Point
	attr_reader :x
	attr_reader :y

	def distance(to)
		Math.sqrt((to.x - @x)**2 + (to.y - @y)**2)
	end

	def initialize (x=0, y=0)
		@x = x
		@y = y
	end

	def betweenY(b, point)
		point.x == @x && point.y >= @y && point.y <= b.y
	end

	def betweenX(b, point)
		point.y == @y && point.x >= @x && point.x <= b.x
	end

	def move_up(delta)
		@y += delta
	end

	def ==(other)
		raise 'Invalid Parameter' unless other.is_a?(Point)
		@x == other.x && @y == other.y
	end

	def to_s
		"{#{@x},#{@y}} "
	end

	def eql?(other)
		self.==(other)
	end

	def inspect
		self.to_s
	end

	def hash
		[@x, @y].hash
	end

	def <=>(other)
		[@x, @y] <=> [other.x, other.y]
	end
end

require 'set'
