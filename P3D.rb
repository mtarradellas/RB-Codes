require_relative 'Point.rb'

class Point3D

	def initialize(x, y, z)
		@x = x
		@y = y
		@z = z
	end

	def to_s
		"{#{@x}, #{@y}, #{@z}}"
	end
end