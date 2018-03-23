class Bag

	def initialize
		@bag = Hash.new{0}
	end

	def add(elem)
		@bag[elem]=0 unless @bag.key?(elem)
		@bag[elem]+=1	
	end

	def to_s
		@bag.to_s
	end

	def size
		@bag.size
	end

	def count(elem)
		@bag[elem]
	end

	def delete(elem)
		@bag[elem]-=1
		@bag.delete(elem) if @bag[elem].zero?
		self.count(elem)
	end
end

require_relative 'Point'
my_bag = Bag.new
my_bag.add(Point.new(0, 0))
my_bag.add(Point.new(1, 2))
my_bag.add(Point.new(3, 4))
my_bag.add(Point.new(1, 2))
puts my_bag
puts my_bag.size
puts my_bag.count(Point.new(1, 2))
puts my_bag.delete(Point.new(1, 2))
puts my_bag
puts my_bag.delete(Point.new(1, 2))
puts my_bag