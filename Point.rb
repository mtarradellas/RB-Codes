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

	def to_s
		"{#{@x},#{@y}} "
	end
end

class Circle

	def initialize (center, radius)
		@center = Point.new(center.x, center.y)
		@radius = radius
	end

	def to_s
		"Circulo con centro en " + @center.to_s + "y radio #{@radius}"
	end
end
		
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

class Figure

	def initialize
		raise 'Error'
	end

	def to_s
		raise 'Error'
	end
end

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
end

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
		raise 'Does not belong' if (point.x == a.x) 
	end
end


#Programa de prueba

a = Point.new(0, 0)
b = Point.new(4, 0)
c = Point.new(4, 3)

rectangle = Rectangle.new(a,c)
puts rectangle.area
puts rectangle.perimeter
puts rectangle.base
puts rectangle.hight