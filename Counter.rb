class Counter
	attr_accessor :count
	
	def initialize(start=0)
		@count = start
	end

	def increment(amount=1)
		@count += amount
	end

	def decrement(amount=1)
		@count -= amount
	end

end

my_counter = Counter.new 6
puts my_counter.count
my_counter.increment
my_counter.increment 3
my_counter.decrement
my_counter.decrement 7
puts my_counter.count