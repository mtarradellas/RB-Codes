class Point
	attr_accessor :x
	attr_accessor :y

	def distance(to)
		Math.sqrt(((to.x - @x)*(to.x - @x)) + ((to.y - @y)*(to.y - @y)))
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
		@center = center
		@radius = radius
	end

	def to_s
		"Circulo con centro en " + @center.to_s + "y radio #{@radius}"
	end

end
		
class Point3D < Point
	attr_accessor :z

	def initialize(x, y, z)
		super(x, y)
		@z = z
	end

	def to_s
		"{#{@x}, #{@y}, #{@z}}"
	end
end

class Triangle < Point
	attr_accessor :a
	attr_accessor :b
	attr_accessor :c

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

	def base
		a.x > b.x ? (a.x > c.x ? (b.x > c.x ? (a.x - c.x) : (a.x - b.x)) : (c.x - b.x)) : (b.x > c.x ? (c.x > a.x ? (b.x - a.x) : (b.x - c.x)) : (c.x - a.x))
	end

	def hight
		a.y > b.y ? (a.y > c.y ? (b.y > c.y ? (a.y - c.y) : (a.y - b.y)) : (c.y - b.y)) : (b.y > c.y ? (c.y > a.y ? (b.y - a.y) : (b.y - c.y)) : (c.y - a.y))
	end

end

class Rectangle < 


#Programa de prueba

a = Point.new(0, 0)
b = Point.new(4, 0)
c = Point.new(4, 3)

puts a.distance(c)

tria = Triangle.new(a, b, c)
puts tria.perimeter
puts tria.area
puts tria.base
puts tria.hight