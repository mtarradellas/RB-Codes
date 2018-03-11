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

	def to_s
		"{#{@x},#{@y}} "
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

	PI = 3.1415

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

	def to_s
		"Triangle A = " + a.to_s + ", B = " + b.to_s + ", C = " + c.to_s
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
		if (!a.betweenY(b, point) && !a.betweenX(d, point) && !b.betweenX(c, point) && !d.betweenY(c, point)) 
			puts "Point does not belong to figure's frontier"
		else puts "Points belongs to the figure's frontier"		
		end
	end

	def to_s
		"Rectangle A = " + a.to_s + ", B = " + b.to_s + ", C = " + c.to_s + ", D = " + d.to_s
	end
end

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

	def to_s
		"Circle with center on " + center.to_s + " and radius #{@radius}"
	end
end

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

	def to_s
		"Ellipse with center " + center.to_s + ", A lenght: #{xRadius}, B lenght: #{yRadius}"
	end
end

#Programa de prueba

a = Point.new(0, 0)
b = Point.new(4, 0)
c = Point.new(4, 3)

cir = Circle.new(a, 3)
puts cir
puts cir.area
puts cir.perimeter
ell = Ellipse.new(a, c)
puts ell
puts ell.area
puts ell.perimeter