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

	def ==(other)
		raise 'Invalid Parameter' unless other.is_a(Circle)
		@center == other.center && @radius == other.radius
	end

	def to_s
		"Circle with center on " + center.to_s + " and radius #{@radius}"
	end
end