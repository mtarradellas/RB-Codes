require_relative 'Figure.rb'

class Circle < Figure
	attr_reader :center, :radius

	def initialize(center, radius)
		raise 'Invalid radius' if radius <= 0
		@center = center
		@radius = radius
	end

	def perimeter
		2*PI*radius 
	end

	def area
		PI*(radius**2)
	end

	def move_up(delta)
		@center.move_up delta
	end

	def ==(other)
		raise 'Invalid Parameter' unless other.is_a?(Circle)
		@center == other.center && @radius == other.radius
	end

	def eql?(other)
		self.== other
	end

	def inspect
		self.to_s
	end

	def hash
		[@center, @radius].hash
	end

	def <=>(other)
		self.area <=> other.area
	end

	def to_s
		"Circle with center on " + center.to_s + " and radius #{@radius}"
	end
end

require 'set'
require_relative 'Rectangle'
my_sorted_figure_set = SortedSet.new
my_sorted_figure_set.add(Rectangle.new(Point.new(10, 20), Point.new(20, 10)))
my_sorted_figure_set.add(Circle.new(Point.new(10, 20), 1))
my_sorted_figure_set.add(Circle.new(Point.new(10, 20), 3))
puts my_sorted_figure_set.sort{|a,b| b<=>a}.to_a
