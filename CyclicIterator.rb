class CyclicIterator
	attr_reader :each

	def initialize(vec)
		@each = Enumerator.new do |y|
			i = 0
			loop do
				y << vec[i % vec.size]
				i+=1
			end
		end
	end
end

iter = CyclicIterator.new([1, 2, 3, 4])
p iter.each.take(7)